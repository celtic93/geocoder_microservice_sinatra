Application.configure do |app|
  logger = Ougai::Logger.new(app.root.concat('/', Settings.logger.path), level: Settings.logger.level)
  logger.formatter = Ougai::Formatters::Readable.new(plain: true) if Settings.env == 'development'

  logger.before_log = lambda do |data|
    data[:service] = { name: Settings.app.name }
    data[:request_id] ||= Thread.current[:request_id]
  end

  app.set :logger, logger
end
