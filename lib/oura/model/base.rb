# frozen_string_literal: true

module Oura
  module Model
    # Oura::Mode::Base is base class for Model.
    class Base
      def self.attr_reader(*attrs)
        mod = Module.new do
          attrs.each do |attribute|
            define_method attribute do
              @attrs[attribute.to_sym]
            end
            define_method :"#{attribute}?" do
              !!@attrs[attribute.to_sym]
            end
          end
        end
        const_set(:Attributes, mod) unless defined? Attributes
        include mod
      end

      def self.object_from_response(response = {})
        new(response[:body])
      end

      def initialize(attrs = {})
        @attrs = attrs
      end

      def [](method)
        send(method.to_sym)
      rescue NoMethodError => e
        puts e.inspect
      end

      attr_reader :attrs
      alias to_hash attrs

      def update(attrs)
        @attrs.update(attrs)
        self
      end

      protected

      # @param attr [Symbol]
      # @param other [Square::Base]
      # @return [Boolean]
      def attr_equal(attr, other)
        self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
      end

      # @param other [Square::Base]
      # @return [Boolean]
      def attrs_equal(other)
        self.class == other.class && !other.attrs.empty? && attrs == other.attrs
      end
    end
  end
end
