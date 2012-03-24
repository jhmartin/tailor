Feature: Indentation check on good files without trailing newlines

  @good_files
  Scenario Outline: Don't detect problems on properly indented files with no newlines at the end
    Given <File> exists without a newline at the end
    And my configuration file "testfile.yml" looks like:
    """
    ---
    :style:
      :indentation:
        :spaces: 2
      :vertical_spacing:
        :trailing_newlines: 0
      :horizontal_spacing:
        :allow_trailing_spaces: true
    """
    When I successfully run `tailor -d --config-file testfile.yml <File>`
    Then the output should match /Total Problems.*0/
    And the exit status should be 0

  Scenarios: Good class uses
    | File                                         |
    | indent/ok/class                              |
    | indent/ok/nested_class                       |
    | indent/ok/class_empty                        |
    | indent/ok/one_line_class                     |
    | indent/ok/one_line_subclass                  |
    | indent/ok/one_line_subclass_with_inheritance |

  Scenarios: Good single-line statement uses
    | File                                    |
    | indent/ok/class_singlestatement         |
    | indent/ok/require_class_singlestatement |

  @multi_line
  Scenarios: Good multi-line statement uses
    | File                                               |
    | indent/ok/assignment_addition_multistatement       |
    | indent/ok/assignment_hash_multistatement           |
    | indent/ok/assignment_array_multistatement          |
    | indent/ok/assignment_paren_multistatement          |
    | indent/ok/assignment_twolevel_hash_multistatement  |
    | indent/ok/assignment_twolevel_array_multistatement |
    | indent/ok/assignment_twolevel_paren_multistatement |
    | indent/ok/method_call_multistatement               |
    | indent/ok/method_call_multistatement_lonely_paren  |
    | indent/ok/rescue_ending_with_comma                 |
    | indent/ok/keyword_ending_with_period               |

  Scenarios: Good def uses
    | File                                                |
    | indent/ok/def                                       |
    | indent/ok/def_empty                                 |
    | indent/ok/nested_def                                |
    | indent/ok/require_class_singlestatement_def         |
    | indent/ok/require_class_singlestatement_def_content |

  @single_line
  Scenarios: Good single-line modifiers
    | File                                     |
    | indent/ok/if_modifier                    |
    | indent/ok/if_modifier2                   |
    | indent/ok/def_return_if_modifier         |
    | indent/ok/unless_modifier                |
    | indent/ok/def_return_unless_modifier     |
    | indent/ok/while_within_single_line_block |

  @multi_line
  Scenarios: Good multi-line modifiers
    | File                                        |
    | indent/ok/multi_line_if_with_trailing_andop |

  @case
  Scenarios: Good case statements
    | File                              |
    | indent/ok/case_whens_level        |
    | indent/ok/case_strings_in_strings |

  Scenarios: Good 'do' loops
    | File                     |
    | indent/ok/while_do_loop  |
    | indent/ok/while_do_loop2 |
    | indent/ok/until_do_loop  |
    | indent/ok/until_do_loop2 |
    | indent/ok/for_do_loop    |
    | indent/ok/loop_do_loop   |

  Scenarios: Good non-'do' loops
    | File                             |
    | indent/ok/while_as_modifier_loop |
    | indent/ok/until_as_modifier_loop |
    | indent/ok/for_with_break_loop    |
    | indent/ok/for_with_next_loop     |
    | indent/ok/for_with_redo_loop     |
    | indent/ok/for_with_retry_loop    |
    | indent/ok/loop_with_braces       |

  Scenarios: Good single-line brace uses
    | File                                     |
    | indent/ok/single_line_braces             |
    | indent/ok/single_line_braces_as_t_string |

  @multi_line
  Scenarios: Good multi-line brace uses
    | File                                           |
    | indent/ok/multi_line_braces                    |
    | indent/ok/multi_line_braces_as_t_string        |
    | indent/ok/multi_line_lonely_braces             |
    | indent/ok/multi_line_lonely_braces_as_t_string |
    | indent/ok/multi_line_braces_embedded_arrays    |

  Scenarios: Good single-line bracket uses
    | File                                       |
    | indent/ok/single_line_brackets             |
    | indent/ok/single_line_brackets_as_t_string |

  @multi_line
  Scenarios: Good multi-line bracket uses
    | File                                             |
    | indent/ok/multi_line_brackets                    |
    | indent/ok/multi_line_brackets_as_t_string        |
    | indent/ok/multi_line_lonely_brackets             |
    | indent/ok/multi_line_lonely_brackets_as_t_string |
    | indent/ok/multi_line_brackets_embedded_hashes    |

  Scenarios: Good single-line paren uses
    | File                                     |
    | indent/ok/single_line_parens             |
    | indent/ok/single_line_parens_as_t_string |

  @multi_line
  Scenarios: Good multi-line paren uses
    | File                                           |
    | indent/ok/multi_line_parens                    |
    | indent/ok/multi_line_parens_as_t_string        |
    | indent/ok/multi_line_lonely_parens             |
    | indent/ok/multi_line_lonely_parens_as_t_string |

  @multi_line
  Scenarios: Good multi-line operator uses
    | File                                                   |
    | indent/ok/multi_line_andop_in_method                   |
    | indent/ok/multi_line_rshift_in_method                  |
    | indent/ok/multi_line_string_concat_with_plus           |
    | indent/ok/multi_line_string_concat_with_plus_in_parens |
    | indent/ok/multi_line_string_concat_twice               |

  @multi_line
  Scenarios: Good multi-line method calls
    | File                                                    |
    | indent/ok/multi_line_method_call                        |
    | indent/ok/multi_line_method_call_ends_with_period       |
    | indent/ok/multi_line_method_call_ends_with_many_periods |

  @multi_line
  Scenarios: Good multi-line if + logical operators
    | File                                |
    | indent/ok/multi_line_if_logical_and |

  @multi_line
  Scenarios: Good combinations of many things
    | File             |
    | indent/ok/combo1 |
    | indent/ok/combo2 |

  @wip
  Scenarios: WIPs
    | File                    |
    | indent/ok/case_whens_in |

