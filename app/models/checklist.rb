class Checklist < ActiveRecord::Base
  belongs_to :listing

  def as_json(opts={})
    options = { }
    options.merge!(opts)
    super(options)
  end
end
