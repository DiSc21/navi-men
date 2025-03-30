SimpleCov.start do
  SimpleCov.use_merging true
  SimpleCov.minimum_coverage 98.00
  SimpleCov.minimum_coverage_by_file 80
  SimpleCov.refuse_coverage_drop

  add_filter "/doc/mkdocs_templates/"
  add_filter "/doc/build/"
  add_filter "/doc/build_*"
  add_filter "/zsdoc/"
  add_filter "/.git/"
end

SimpleCov.at_exit do
  puts "Coverage done"
  SimpleCov.result.format!
end
