class ValidDateValidator < ActiveModel::Validator
  def validate(record)
    if record.finished < record.started
      record.errors.add(:date, 'Invalite rage date')
   end
  end
end
