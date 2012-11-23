require 'test/unit'
require 'rubygems'
require 'pry-de'
require 'rdiscount'
require 'active_support/core_ext'

$:.unshift File.expand_path "../../lib", __FILE__
require_relative "../app/models/faq"
