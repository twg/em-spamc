class EmSpamc::Result
  # == Constants ============================================================

  ATTRIBUTES = [
    :version,
    :code,
    :message,
    :score,
    :threshold,
    :tags,
    :report
  ].freeze

  # == Instance Methods =====================================================

  def initialize(attributes = nil)
    @attributes = attributes || { }
  end

  def spam?
    @attributes and @attributes[:score] > @attributes[:threshold]
  end

  ATTRIBUTES.each do |name|
    define_method(name) do
      @attributes[name]
    end

    define_method(:"#{name}=") do |value|
      @attributes[name] = value
    end
  end
end
