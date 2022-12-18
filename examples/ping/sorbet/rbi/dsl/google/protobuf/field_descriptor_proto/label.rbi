# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::FieldDescriptorProto::Label`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::FieldDescriptorProto::Label`.

module Google::Protobuf::FieldDescriptorProto::Label
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

Google::Protobuf::FieldDescriptorProto::Label::LABEL_OPTIONAL = 1
Google::Protobuf::FieldDescriptorProto::Label::LABEL_REPEATED = 3
Google::Protobuf::FieldDescriptorProto::Label::LABEL_REQUIRED = 2
