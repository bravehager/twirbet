# typed: true
# frozen_string_literal: true

module Twirbet
  class Method
    extend T::Sig
    include Comparable

    sig { returns(String) }
    attr_reader :name

    sig { returns(Class) }
    attr_reader :request

    sig { returns(Class) }
    attr_reader :response

    sig { returns(Symbol) }
    attr_reader :ruby_method

    sig { params(name: String, request: Class, response: Class, ruby_method: Symbol).void }
    def initialize(name, request, response, ruby_method:)
      @name = name
      @request = request
      @response = response
      @ruby_method = ruby_method
    end

    sig { params(other: T.untyped).returns(Integer) }
    def <=>(other)
      [name, request, response, ruby_method] <=> [other.name, other.request, other.response, other.ruby_method]
    end
  end
end
