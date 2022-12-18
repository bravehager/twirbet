# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::FileDescriptorProto`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::FileDescriptorProto`.

class Google::Protobuf::FileDescriptorProto
  sig do
    params(
      dependency: T.nilable(T.any(Google::Protobuf::RepeatedField[String], T::Array[String])),
      enum_type: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto], T::Array[Google::Protobuf::EnumDescriptorProto])),
      extension: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto], T::Array[Google::Protobuf::FieldDescriptorProto])),
      message_type: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto], T::Array[Google::Protobuf::DescriptorProto])),
      name: T.nilable(String),
      options: T.nilable(Google::Protobuf::FileOptions),
      package: T.nilable(String),
      public_dependency: T.nilable(T.any(Google::Protobuf::RepeatedField[Integer], T::Array[Integer])),
      service: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::ServiceDescriptorProto], T::Array[Google::Protobuf::ServiceDescriptorProto])),
      source_code_info: T.nilable(Google::Protobuf::SourceCodeInfo),
      syntax: T.nilable(String),
      weak_dependency: T.nilable(T.any(Google::Protobuf::RepeatedField[Integer], T::Array[Integer]))
    ).void
  end
  def initialize(dependency: Google::Protobuf::RepeatedField.new(:string), enum_type: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::EnumDescriptorProto), extension: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::FieldDescriptorProto), message_type: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::DescriptorProto), name: nil, options: nil, package: nil, public_dependency: Google::Protobuf::RepeatedField.new(:int32), service: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::ServiceDescriptorProto), source_code_info: nil, syntax: nil, weak_dependency: Google::Protobuf::RepeatedField.new(:int32)); end

  sig { returns(Google::Protobuf::RepeatedField[String]) }
  def dependency; end

  sig { params(value: Google::Protobuf::RepeatedField[String]).void }
  def dependency=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto]) }
  def enum_type; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto]).void }
  def enum_type=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto]) }
  def extension; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto]).void }
  def extension=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto]) }
  def message_type; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto]).void }
  def message_type=(value); end

  sig { returns(String) }
  def name; end

  sig { params(value: String).void }
  def name=(value); end

  sig { returns(T.nilable(Google::Protobuf::FileOptions)) }
  def options; end

  sig { params(value: T.nilable(Google::Protobuf::FileOptions)).void }
  def options=(value); end

  sig { returns(String) }
  def package; end

  sig { params(value: String).void }
  def package=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Integer]) }
  def public_dependency; end

  sig { params(value: Google::Protobuf::RepeatedField[Integer]).void }
  def public_dependency=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::ServiceDescriptorProto]) }
  def service; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::ServiceDescriptorProto]).void }
  def service=(value); end

  sig { returns(T.nilable(Google::Protobuf::SourceCodeInfo)) }
  def source_code_info; end

  sig { params(value: T.nilable(Google::Protobuf::SourceCodeInfo)).void }
  def source_code_info=(value); end

  sig { returns(String) }
  def syntax; end

  sig { params(value: String).void }
  def syntax=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Integer]) }
  def weak_dependency; end

  sig { params(value: Google::Protobuf::RepeatedField[Integer]).void }
  def weak_dependency=(value); end
end
