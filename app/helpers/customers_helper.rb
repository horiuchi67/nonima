module CustomersHelper
	  def kanji_full_name(customer)
    "#{customer.last_name}#{customer.first_name}"
  end
  def kana_full_name(customer)
    "#{customer.last_name_kana}#{customer.first_name_kana}"
  end
end
