<?php

namespace app;

use Phalcon\DI;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Mvc\Router;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Http\Response;
use Phalcon\Http\Request;
use Phalcon\Mvc\Model\Manager as ModelsManager;
use Phalcon\Mvc\Application as BaseApplication;
use Phalcon\Mvc\Model\Metadata\Memory as MemoryMetaData;

class Application extends BaseApplication {

    /**
     *  More autoload
     */
    protected function registerAutoloaders() {
        
    }

    /**
     * This methods registers the services to be used by the application
     */
    protected function registerServices() {
        $di = new DI();
        $di->setShared(
                'session', function () {
            $session = new \Phalcon\Session\Adapter\Files();

            $session->start();

            return $session;
        }
        );
        
        $di->setShared(
                'filter', function () {
           $filter = new \Phalcon\Filter();
           return $filter;
        }
        );
       




        // Registering a router
        $di->set('router', function () {
            $router = new Router();

            $router->setDefaultController('index');
            $router->setDefaultAction('index');
            $router->add(
                    "/:controller/:action/:params", [
                "controller" => 1,
                "action" => 2,
                'params' => 3
                    ]
            );

            return $router;
        });

        /**
         * The URL component is used to generate all kind of urls in the application
         */
        $di["url"] = function () {
            $url = new \Phalcon\Mvc\Url();
            $url->setBaseUri("/");
            return $url;
        };


        // Registering a dispatcher
        $di->set('dispatcher', function () {
            $dispatcher = new Dispatcher();
            $dispatcher->setDefaultNamespace('app\controllers\\');
            $dispatcher->setControllerSuffix('');
            $dispatcher->setActionSuffix('');
            return $dispatcher;
        });

        // Registering a Http\Response
        $di->set('response', function () {
            return new Response();
        });

        // Registering a Http\Request
        $di->set('request', function () {
            return new Request();
        });

        // Registering the view component
        $di->set('view', function () {
            $view = new View();
            $view->setViewsDir(WWW_ROOT . '/app/views/');
            $view->registerEngines(
                    [
                        '.volt' => function ($view, $di) {
                            $volt = new Volt($view, $di);
                            $volt->setOptions([
                                'compileAlways' => !APP_DEBUG,
                                "compiledPath" => function ($templatePath) {
                                    if (!is_dir(WWW_ROOT . "/runtime/view/")) {
                                        mkdir(WWW_ROOT . "/runtime/view/", true);
                                    }
                                    return WWW_ROOT . "/runtime/view/" . md5($templatePath) . ".volt.php";
                                },
                            ]);
                             $compiler = $volt->getCompiler();
                            // 增加扩展方法
                            $compiler->addFunction("array_merge", 'array_merge');
                            return $volt;
                        }
                    ]
            );

            return $view;
        });


        // Registering the Models-Metadata
        $di->set('modelsMetadata', function () {
            return new MemoryMetaData();
        });

        // Registering the Models Manager
        $di->set('modelsManager', function () {
            return new ModelsManager();
        });

        $this->setDI($di);
    }

    public function start() {
        include 'function.php';
        $this->registerServices();
        $this->registerAutoloaders();
        $this->registerDb();
        $response = $this->handle();
        $response->send();
    }

    /**
     * 注册数据库
     */
    private function registerDb() {
        $di = \Phalcon\Di::getDefault();

        $di->set(
                'db', function () {
            $config = [
                'host' => getenv('DATABASE_HOST'),
                'username' => getenv('DATABASE_USER'),
                'password' => getenv('DATABASE_PASS'),
                'dbname' => getenv('DATABASE_NAME'),
                'port' => getenv('DATABASE_PORT'),
                'adapter' => getenv('DATABASE_TYPE'),
                'charset' => 'utf8'
            ];
//            dd($config);
            return \Phalcon\Db\Adapter\Pdo\Factory::load($config);
        }
        );
    }

}
