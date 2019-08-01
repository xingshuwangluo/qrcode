<?php

$config = [
    'host' => getenv('DATABASE_HOST'),
    'username' => getenv('DATABASE_USER'),
    'password' => getenv('DATABASE_PASS'),
    'dbname' => getenv('DATABASE_NAME'),
    'port' => getenv('DATABASE_PORT'),
    'adapter' => getenv('DATABASE_TYPE'),
    'charset' => 'utf8'
];

return $config;