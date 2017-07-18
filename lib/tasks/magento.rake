require 'highline'
require 'csv'

namespace :magento do
  desc 'Import products from magento v1 cvs'
  task products: :environment do
    # http://docs.magento.com/m1/ce/user_guide/store-operations/data-export.html
    # https://www.atensoftware.com/p187.php
    Dir.glob("#{Rails.root}/tmp/magento/*.csv") do |fn|
      cli = HighLine.new
      unless cli.agree("load data from file #{fn}?  ")
        next
      end

      CSV.foreach(fn) do |row|
        next if $. == 1
        puts "#{row[4]} #{row[7]} #{row[34]}"
        if row[34] == 'Enabled'
          puts "find product #{row[4]} #{row[7]}"
          Spree::Product.create sku: row[4], name: row[7], price: row[27], description: row[29], available_on: Time.now, shipping_category_id: 1
        end
      end
    end
  end

end