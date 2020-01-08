## Remove all key which value is blank?

class Hash
# simple but can not adapt to nested hash
  def squeeze
    select{|_, v| !v.blank? }
  end
  # complex but can adapt to nested hash
  def squeeze_deep
    each_with_object({}) do |(k, v), squeezed_hash|
      if v.is_a?(Hash)
        squeezed_hash[k] = v.squeeze
      else
        squeezed_hash[k] = v unless v.blank?
      end
    end
  end
end
