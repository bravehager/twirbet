# typed: false
# frozen_string_literal: true

require "spec_helper"

RSpec.shared_examples("Twirbet DSL") do
  describe ".package_name" do
    context "when package is not set" do
      subject(:service) { Class.new(described_class) }

      it "returns nil" do
        expect(service.package_name).to(be_nil)
      end
    end

    context "when package is set" do
      subject(:service) do
        Class.new(described_class) do
          package("foo")
        end
      end

      it "returns the package name" do
        expect(service.package_name).to(eq("foo"))
      end
    end
  end

  describe ".service_name" do
    context "when service is not set" do
      subject(:service) { Class.new(described_class) }

      it "raises an error" do
        expect { service.service_name }.to(raise_error("Unknown service name. Did you forget to call `service`?"))
      end
    end

    context "when service is set" do
      subject(:service) do
        Class.new(Twirbet::Service) do
          service("Foo")
        end
      end

      it "returns the service name" do
        expect(service.service_name).to(eq("Foo"))
      end
    end
  end

  describe ".full_name" do
    context "when package and service are not set" do
      subject(:service) { Class.new(described_class) }

      it "raises an error" do
        expect { service.full_name }.to(raise_error("Unknown service name. Did you forget to call `service`?"))
      end
    end

    context "when package is set" do
      subject(:service) do
        Class.new(Twirbet::Service) do
          package("foo")
          service("Foo")
        end
      end

      it "returns the full name" do
        expect(service.full_name).to(eq("foo.Foo"))
      end
    end

    context "when package is not set" do
      subject(:service) do
        Class.new(Twirbet::Service) do
          service("Foo")
        end
      end

      it "returns the full name" do
        expect(service.full_name).to(eq("Foo"))
      end
    end
  end

  describe ".rpcs" do
    context "when no rpcs are defined" do
      subject(:service) { Class.new(described_class) }

      it "returns an empty hash" do
        expect(service.rpcs).to(eq({}))
      end
    end

    context "when rpcs are defined" do
      subject(:service) do
        Class.new(Twirbet::Service) do
          rpc("Foo", String, String, ruby_method: :foo)
          rpc("Bar", String, String, ruby_method: :bar)
        end
      end

      it "returns a hash of rpcs" do
        expect(service.rpcs).to(eq({
          "Foo" => Twirbet::Method.new("Foo", String, String, ruby_method: :foo),
          "Bar" => Twirbet::Method.new("Bar", String, String, ruby_method: :bar),
        }))
      end
    end
  end
end
