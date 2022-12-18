# typed: true
# frozen_string_literal: true

require "twirbet/method"

module Twirbet
  module DSL
    extend T::Sig
    extend T::Helpers

    requires_ancestor { Kernel }

    module ClassMethods
      extend T::Sig
      extend T::Helpers

      requires_ancestor { Kernel }

      sig { params(name: T.nilable(String)).void }
      def package(name)
        @package = name
      end

      sig { returns(T.nilable(String)) }
      def package_name
        @package
      end

      sig { params(name: String).void }
      def service(name)
        @service = name
      end

      sig { returns(String) }
      def service_name
        raise "Unknown service name. Did you forget to call `service`?" if @service.nil?

        @service
      end

      sig { returns(String) }
      def full_name
        if package_name.nil?
          service_name
        else
          "#{package_name}.#{service_name}"
        end
      end

      sig { params(name: String, request: Class, response: Class, ruby_method: Symbol).void }
      def rpc(name, request, response, ruby_method:)
        method = Method.new(name, request, response, ruby_method: ruby_method)
        rpcs[method.name] = method
      end

      sig { returns(T::Hash[String, Method]) }
      def rpcs
        @rpcs ||= {}
      end
    end

    mixes_in_class_methods(ClassMethods)

    sig { returns(T.nilable(String)) }
    def package_name
      self.class.package_name
    end

    sig { returns(String) }
    def service_name
      self.class.service_name
    end

    sig { returns(String) }
    def full_name
      self.class.full_name
    end

    sig { params(name: String).returns(T.nilable(Method)) }
    def rpc(name)
      self.class.rpcs[name]
    end
  end
end
