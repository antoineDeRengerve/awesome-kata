# frozen_string_literal: true

require "minitest/autorun"
require_relative "../src/kata2/karate_guy"

class TestKata2KarateChop < Minitest::Test
  def eval_chop(karate_guy)
    assert_equal(-1, karate_guy.chop(3, []))
    assert_equal(-1, karate_guy.chop(3, [1]))
    assert_equal(0, karate_guy.chop(1, [1]))
    assert_equal(-1, karate_guy.chop(3, [1, 2]))
    assert_equal(0, karate_guy.chop(1, [1, 3, 5]))
    assert_equal(1, karate_guy.chop(3, [1, 3, 5]))
    assert_equal(2, karate_guy.chop(5, [1, 3, 5]))
    assert_equal(-1, karate_guy.chop(0, [1, 3, 5]))
    assert_equal(-1, karate_guy.chop(2, [1, 3, 5]))
    assert_equal(-1, karate_guy.chop(4, [1, 3, 5]))
    assert_equal(-1, karate_guy.chop(6, [1, 3, 5]))
    assert_equal(0, karate_guy.chop(1, [1, 3, 5, 7]))
    assert_equal(1, karate_guy.chop(3, [1, 3, 5, 7]))
    assert_equal(2, karate_guy.chop(5, [1, 3, 5, 7]))
    assert_equal(3, karate_guy.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, karate_guy.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, karate_guy.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, karate_guy.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, karate_guy.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, karate_guy.chop(8, [1, 3, 5, 7]))
  end

  def test_chop_1
    eval_chop(Kata2::KarateGuy.new(:chop_1))
  end

  def test_chop_2
    eval_chop(Kata2::KarateGuy.new(:chop_2))
  end
end
