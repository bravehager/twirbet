# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::DescriptorProto`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::DescriptorProto`.

class Google::Protobuf::DescriptorProto
  sig do
    params(
      enum_type: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto], T::Array[Google::Protobuf::EnumDescriptorProto])),
      extension: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto], T::Array[Google::Protobuf::FieldDescriptorProto])),
      extension_range: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto::ExtensionRange], T::Array[Google::Protobuf::DescriptorProto::ExtensionRange])),
      field: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto], T::Array[Google::Protobuf::FieldDescriptorProto])),
      name: T.nilable(String),
      nested_type: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto], T::Array[Google::Protobuf::DescriptorProto])),
      oneof_decl: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::OneofDescriptorProto], T::Array[Google::Protobuf::OneofDescriptorProto])),
      options: T.nilable(Google::Protobuf::MessageOptions),
      reserved_name: T.nilable(T.any(Google::Protobuf::RepeatedField[String], T::Array[String])),
      reserved_range: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto::ReservedRange], T::Array[Google::Protobuf::DescriptorProto::ReservedRange]))
    ).void
  end
  def initialize(enum_type: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::EnumDescriptorProto), extension: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::FieldDescriptorProto), extension_range: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::DescriptorProto::ExtensionRange), field: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::FieldDescriptorProto), name: nil, nested_type: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::DescriptorProto), oneof_decl: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::OneofDescriptorProto), options: nil, reserved_name: Google::Protobuf::RepeatedField.new(:string), reserved_range: Google::Protobuf::RepeatedField.new(:message, Google::Protobuf::DescriptorProto::ReservedRange)); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto]) }
  def enum_type; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto]).void }
  def enum_type=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto]) }
  def extension; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto]).void }
  def extension=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto::ExtensionRange]) }
  def extension_range; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto::ExtensionRange]).void }
  def extension_range=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto]) }
  def field; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::FieldDescriptorProto]).void }
  def field=(value); end

  sig { returns(String) }
  def name; end

  sig { params(value: String).void }
  def name=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto]) }
  def nested_type; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto]).void }
  def nested_type=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::OneofDescriptorProto]) }
  def oneof_decl; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::OneofDescriptorProto]).void }
  def oneof_decl=(value); end

  sig { returns(T.nilable(Google::Protobuf::MessageOptions)) }
  def options; end

  sig { params(value: T.nilable(Google::Protobuf::MessageOptions)).void }
  def options=(value); end

  sig { returns(Google::Protobuf::RepeatedField[String]) }
  def reserved_name; end

  sig { params(value: Google::Protobuf::RepeatedField[String]).void }
  def reserved_name=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto::ReservedRange]) }
  def reserved_range; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::DescriptorProto::ReservedRange]).void }
  def reserved_range=(value); end
end
