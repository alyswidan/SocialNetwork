class AdvancedSearch
  extend ActiveModel::Naming
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :email, :city, :caption, :simple

  def results
    @results ||= find_results
  end

  def to_model
    # You will get to_model error, if you don't have this dummy method
  end

  # You need this otherwise you get an error
  def persisted?
    false
  end

  private

  def find_results
    user = User
    instance_variables.each(&:downcase)

    if simple.blank?
      user = user.joins(:posts) unless caption.blank?
      user = user.joins(:city) unless city.blank?
      user.where(conditions).distinct
    else
      user.where(conditions_simple).distinct
    end



  end

  def first_name_conditions
    ['first_name LIKE ?', "%#{first_name}%"] unless first_name.blank?
  end

  def last_name_conditions
    ['last_name LIKE ?', "%#{last_name}%"] unless last_name.blank?
  end

  def email_conditions
    ['email LIKE ?', "%#{email}%"] unless email.blank?
  end

  def caption_conditions
    ['caption LIKE ?', "%#{caption}%"] unless caption.blank?
  end

  def city_conditions
    ['cities.name LIKE ?', "%#{city}%"] unless city.blank?
  end

  def conditions
    x = conditions_clauses
    x.push true
    [x.join(' AND '), *conditions_options]
  end

  def conditions_simple
    ['first_name like ? or last_name like ?',"%#{simple}%","%#{simple}%"]
  end

  def conditions_clauses
    conditions_parts.map(&:first)
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end



end
