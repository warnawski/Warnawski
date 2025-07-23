package config

type Configuration struct {
		Service     ServiceConfig     `mapstructure:"service"`
		Observality ObservalityConfig `mapstructure:"observality"`
}

type ServiceConfig struct {
		HTTP   HTTPConfig   `mapstructure:"http"`
		Logger LoggerConfig `mapstructure:"logger"`
}

type ObservalityConfig struct{}

type HTTPConfig struct{}

type LoggerConfig struct{}
