# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `twirbet` gem.
# Please instead update this file by running `bin/tapioca gem twirbet`.

# source://twirbet//lib/twirbet/method.rb#4
module Twirbet; end

# source://twirbet//lib/twirbet/errors.rb#215
class Twirbet::AbortedError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#219
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#224
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#145
class Twirbet::AlreadyExistsError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#149
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#154
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#131
class Twirbet::BadRouteError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#135
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#140
  sig { override.returns(::Integer) }
  def status; end
end

# @abstract It cannot be directly instantiated. Subclasses must implement the `abstract` methods below.
#
# source://twirbet//lib/twirbet/errors.rb#8
class Twirbet::BaseError < ::StandardError
  abstract!

  # source://twirbet//lib/twirbet/errors.rb#18
  sig { params(message: ::String, metadata: T::Hash[::String, ::String]).void }
  def initialize(message, metadata = T.unsafe(nil)); end

  # @abstract
  #
  # source://twirbet//lib/twirbet/errors.rb#24
  sig { abstract.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#15
  sig { returns(T::Hash[::String, ::String]) }
  def metadata; end

  # @abstract
  #
  # source://twirbet//lib/twirbet/errors.rb#28
  sig { abstract.returns(::Integer) }
  def status; end

  # source://twirbet//lib/twirbet/errors.rb#42
  sig(:final) { returns(T::Hash[::String, ::String]) }
  def to_hash; end

  # source://twirbet//lib/twirbet/errors.rb#37
  sig(:final) { returns(::String) }
  def to_json; end

  # source://twirbet//lib/twirbet/errors.rb#32
  sig(:final) { returns(::Rack::Response) }
  def to_rack_response; end
end

# source://twirbet//lib/twirbet/errors.rb#47
class Twirbet::CanceledError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#51
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#56
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/client.rb#10
class Twirbet::Client
  include ::Twirbet::DSL
  extend ::Twirbet::DSL::ClassMethods

  # source://twirbet//lib/twirbet/client.rb#21
  sig { params(base_url: ::String, transport: ::Twirbet::Transport).void }
  def initialize(base_url, transport: T.unsafe(nil)); end

  # source://twirbet//lib/twirbet/client.rb#15
  sig { returns(::String) }
  def base_url; end

  # @raise [ArgumentError]
  #
  # source://twirbet//lib/twirbet/client.rb#27
  sig { params(method_name: ::String, request: T.untyped).returns(T.untyped) }
  def call(method_name, request); end

  # source://twirbet//lib/twirbet/client.rb#18
  sig { returns(::Twirbet::Transport) }
  def transport; end
end

# source://twirbet//lib/twirbet/dsl.rb#7
module Twirbet::DSL
  requires_ancestor { Kernel }

  mixes_in_class_methods ::Twirbet::DSL::ClassMethods

  # source://twirbet//lib/twirbet/dsl.rb#75
  sig { returns(::String) }
  def full_name; end

  # source://twirbet//lib/twirbet/dsl.rb#65
  sig { returns(T.nilable(::String)) }
  def package_name; end

  # source://twirbet//lib/twirbet/dsl.rb#80
  sig { params(name: ::String).returns(T.nilable(::Twirbet::Method)) }
  def rpc(name); end

  # source://twirbet//lib/twirbet/dsl.rb#70
  sig { returns(::String) }
  def service_name; end
end

# source://twirbet//lib/twirbet/dsl.rb#13
module Twirbet::DSL::ClassMethods
  requires_ancestor { Kernel }

  # source://twirbet//lib/twirbet/dsl.rb#42
  sig { returns(::String) }
  def full_name; end

  # source://twirbet//lib/twirbet/dsl.rb#20
  sig { params(name: T.nilable(::String)).void }
  def package(name); end

  # source://twirbet//lib/twirbet/dsl.rb#25
  sig { returns(T.nilable(::String)) }
  def package_name; end

  # source://twirbet//lib/twirbet/dsl.rb#51
  sig { params(name: ::String, request: ::Class, response: ::Class, ruby_method: ::Symbol).void }
  def rpc(name, request, response, ruby_method:); end

  # source://twirbet//lib/twirbet/dsl.rb#57
  sig { returns(T::Hash[::String, ::Twirbet::Method]) }
  def rpcs; end

  # source://twirbet//lib/twirbet/dsl.rb#30
  sig { params(name: ::String).void }
  def service(name); end

  # source://twirbet//lib/twirbet/dsl.rb#35
  sig { returns(::String) }
  def service_name; end
end

# source://twirbet//lib/twirbet/errors.rb#285
class Twirbet::DataLossError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#289
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#294
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#103
class Twirbet::DeadlineExceededError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#107
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#112
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/encoding.rb#5
module Twirbet::Encoding
  class << self
    # source://twirbet//lib/twirbet/encoding.rb#40
    sig { params(object: T.untyped, klass: ::Class, content_type: ::String).returns(T.untyped) }
    def decode(object, klass, content_type); end

    # source://twirbet//lib/twirbet/encoding.rb#20
    sig { params(request: ::Rack::Request).returns(T.untyped) }
    def decode_request(request); end

    # source://twirbet//lib/twirbet/encoding.rb#28
    sig { params(object: T.untyped, content_type: ::String).returns(T.untyped) }
    def encode(object, content_type); end

    # source://twirbet//lib/twirbet/encoding.rb#15
    sig { params(request: T.untyped, klass: ::Class).returns(T.untyped) }
    def encode_request(request, klass); end

    # source://twirbet//lib/twirbet/encoding.rb#10
    sig { params(content_type: T.nilable(::String)).returns(T::Boolean) }
    def supported?(content_type); end
  end
end

# source://twirbet//lib/twirbet/errors.rb#299
module Twirbet::Error
  class << self
    # source://twirbet//lib/twirbet/errors.rb#347
    sig { params(code: ::String, message: ::String).returns(::Twirbet::BaseError) }
    def build(code, message); end

    # source://twirbet//lib/twirbet/errors.rb#326
    sig { params(exception: ::Exception).returns(::Twirbet::BaseError) }
    def from_exception(exception); end

    # source://twirbet//lib/twirbet/errors.rb#342
    sig { params(hash: T::Hash[::String, ::String]).returns(::Twirbet::BaseError) }
    def from_hash(hash); end

    # source://twirbet//lib/twirbet/errors.rb#336
    sig { params(json: ::String).returns(::Twirbet::BaseError) }
    def from_json(json); end
  end
end

# source://twirbet//lib/twirbet/errors.rb#302
Twirbet::Error::CODE_MAP = T.let(T.unsafe(nil), Hash)

# source://twirbet//lib/twirbet/errors.rb#201
class Twirbet::FailedPreconditionError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#205
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#210
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#257
class Twirbet::InternalError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#261
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#266
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#75
class Twirbet::InvalidArgumentError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#79
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#84
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#89
class Twirbet::MalformedError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#93
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#98
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/method.rb#5
class Twirbet::Method
  include ::Comparable

  # source://twirbet//lib/twirbet/method.rb#22
  sig { params(name: ::String, request: ::Class, response: ::Class, ruby_method: ::Symbol).void }
  def initialize(name, request, response, ruby_method:); end

  # source://twirbet//lib/twirbet/method.rb#30
  sig { params(other: T.untyped).returns(::Integer) }
  def <=>(other); end

  # source://twirbet//lib/twirbet/method.rb#10
  sig { returns(::String) }
  def name; end

  # source://twirbet//lib/twirbet/method.rb#13
  sig { returns(::Class) }
  def request; end

  # source://twirbet//lib/twirbet/method.rb#16
  sig { returns(::Class) }
  def response; end

  # source://twirbet//lib/twirbet/method.rb#19
  sig { returns(::Symbol) }
  def ruby_method; end
end

# source://twirbet//lib/twirbet/errors.rb#117
class Twirbet::NotFoundError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#121
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#126
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#229
class Twirbet::OutOfRangeError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#233
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#238
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#159
class Twirbet::PermissionDeniedError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#163
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#168
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#187
class Twirbet::ResourceExhaustedError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#191
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#196
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/service.rb#10
class Twirbet::Service
  include ::Twirbet::DSL
  extend ::Twirbet::DSL::ClassMethods

  # @return [Service] a new instance of Service
  #
  # source://twirbet//lib/twirbet/service.rb#17
  def initialize(handler); end

  # source://twirbet//lib/twirbet/service.rb#22
  sig { params(env: T.untyped).returns(T.untyped) }
  def call(env); end

  # source://twirbet//lib/twirbet/service.rb#15
  sig { returns(T.untyped) }
  def handler; end

  private

  # source://twirbet//lib/twirbet/service.rb#38
  sig { params(method: ::Twirbet::Method, request: ::Rack::Request).returns(T.untyped) }
  def invoke_method(method, request); end

  # @raise [BadRouteError]
  #
  # source://twirbet//lib/twirbet/service.rb#63
  sig { params(request: ::Rack::Request).void }
  def validate_content_type(request); end

  # @raise [BadRouteError]
  #
  # source://twirbet//lib/twirbet/service.rb#56
  sig { params(request: ::Rack::Request).void }
  def validate_method(request); end

  # @raise [BadRouteError]
  #
  # source://twirbet//lib/twirbet/service.rb#70
  sig { params(request: ::Rack::Request).void }
  def validate_path(request); end

  # source://twirbet//lib/twirbet/service.rb#49
  sig { params(request: ::Rack::Request).void }
  def validate_request(request); end
end

# @abstract Subclasses must implement the `abstract` methods below.
#
# source://twirbet//lib/twirbet/transport.rb#5
module Twirbet::Transport
  interface!

  # @abstract
  #
  # source://twirbet//lib/twirbet/transport.rb#48
  sig { abstract.params(request: ::Twirbet::Transport::Request).returns(::Twirbet::Transport::Response) }
  def call(request); end
end

# source://twirbet//lib/twirbet/transport.rb#9
class Twirbet::Transport::Request
  # source://twirbet//lib/twirbet/transport.rb#22
  sig { params(url: ::String, body: ::String, headers: T::Hash[::String, ::String]).void }
  def initialize(url, body, headers); end

  # source://twirbet//lib/twirbet/transport.rb#16
  sig { returns(::String) }
  def body; end

  # source://twirbet//lib/twirbet/transport.rb#19
  sig { returns(T::Hash[::String, ::String]) }
  def headers; end

  # source://twirbet//lib/twirbet/transport.rb#13
  sig { returns(::String) }
  def url; end
end

# source://twirbet//lib/twirbet/transport.rb#29
class Twirbet::Transport::Response
  # source://twirbet//lib/twirbet/transport.rb#39
  sig { params(status: ::Integer, body: ::String).void }
  def initialize(status, body); end

  # source://twirbet//lib/twirbet/transport.rb#36
  sig { returns(::String) }
  def body; end

  # source://twirbet//lib/twirbet/transport.rb#33
  sig { returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/transports/net_http_transport.rb#8
module Twirbet::Transports; end

# source://twirbet//lib/twirbet/transports/net_http_transport.rb#9
class Twirbet::Transports::NetHTTPTransport
  include ::Twirbet::Transport

  # source://twirbet//lib/twirbet/transports/net_http_transport.rb#14
  sig { override.params(request: ::Twirbet::Transport::Request).returns(::Twirbet::Transport::Response) }
  def call(request); end
end

# source://twirbet//lib/twirbet/errors.rb#173
class Twirbet::UnauthenticatedError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#177
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#182
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#271
class Twirbet::UnavailableError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#275
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#280
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#243
class Twirbet::UnimplementedError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#247
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#252
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/errors.rb#61
class Twirbet::UnknownError < ::Twirbet::BaseError
  # source://twirbet//lib/twirbet/errors.rb#65
  sig { override.returns(::String) }
  def code; end

  # source://twirbet//lib/twirbet/errors.rb#70
  sig { override.returns(::Integer) }
  def status; end
end

# source://twirbet//lib/twirbet/version.rb#5
Twirbet::VERSION = T.let(T.unsafe(nil), String)
