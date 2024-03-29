# encoding: utf-8
class Time
  
  SECONDS_IN_ONE_MINUTE = 60
  SECONDS_IN_ONE_HOUR = (60 * 60)
  SECONDS_IN_ONE_DAY = (60 * 60 * 24)
  SECONDS_IN_ONE_MONTH = (60 * 60 * 24 * 30)
  SECONDS_IN_ONE_YEAR = (60 * 60 * 24 * 30 * 12)
  
  def semantic_time
    
    time_number = ""
    prefix = ""
    suffix = "ที่แล้ว"
    
    duration = Time.now.utc - self.utc
    
    if duration < 0
      suffix = ""
      prefix = "อีก "
      duration = -duration
    end
   
    if duration >= 0 and duration < SECONDS_IN_ONE_MINUTE

        time_number = duration.to_f.round
        suffix = " วินาที#{suffix}"
        
    elsif duration >= SECONDS_IN_ONE_MINUTE and duration < SECONDS_IN_ONE_HOUR
      
      time_number = (duration / SECONDS_IN_ONE_MINUTE).to_f.round
      suffix = " นาที#{suffix}"
      
    elsif duration >= SECONDS_IN_ONE_HOUR and duration < SECONDS_IN_ONE_DAY
      
      time_number = (duration / SECONDS_IN_ONE_HOUR).to_f.round
      suffix = " ชั่วโมง#{suffix}"
      
    elsif duration >= SECONDS_IN_ONE_DAY and duration < SECONDS_IN_ONE_MONTH
      
      time_number = (duration / SECONDS_IN_ONE_DAY).to_f.floor
      suffix = " วัน#{suffix}"

    elsif duration >= SECONDS_IN_ONE_MONTH and duration < SECONDS_IN_ONE_YEAR
      
      time_number = (duration / SECONDS_IN_ONE_MONTH).to_f.floor
      suffix = " เดือน#{suffix}"
      
    elsif duration >= SECONDS_IN_ONE_YEAR
      
      time_number = (duration / SECONDS_IN_ONE_YEAR).to_f.floor
      suffix = " ปี#{suffix}"
      
    end
      
    return "#{prefix}#{time_number}#{suffix}"
    
  end
  
  def semantic_time_eng
    
    time_number = ""
    prefix = ""
    suffix = "ago"
    
    duration = Time.now.utc - self.utc
    
    if duration < 0
      suffix = "left"
      duration = -duration
    end
   
    if duration >= 0 and duration < SECONDS_IN_ONE_MINUTE

      time_number = duration.to_f.round
      if time_number == 1
        suffix = " second #{suffix}"
      else
        suffix = " seconds #{suffix}"
      end
        
    elsif duration >= SECONDS_IN_ONE_MINUTE and duration < SECONDS_IN_ONE_HOUR
      
      time_number = (duration / SECONDS_IN_ONE_MINUTE).to_f.round
      if time_number == 1
        suffix = " minute #{suffix}"
      else
        suffix = " minutes #{suffix}"
      end
      
    elsif duration >= SECONDS_IN_ONE_HOUR and duration < SECONDS_IN_ONE_DAY
      
      time_number = (duration / SECONDS_IN_ONE_HOUR).to_f.round
      if time_number == 1
        suffix = " hour #{suffix}"
      else
        suffix = " hours #{suffix}"
      end
      
    elsif duration >= SECONDS_IN_ONE_DAY and duration < SECONDS_IN_ONE_MONTH
      
      time_number = (duration / SECONDS_IN_ONE_DAY).to_f.floor
      if time_number == 1
        suffix = " day #{suffix}"
      else
        suffix = " days #{suffix}"
      end

    elsif duration >= SECONDS_IN_ONE_MONTH and duration < SECONDS_IN_ONE_YEAR
      
      time_number = (duration / SECONDS_IN_ONE_MONTH).to_f.floor
      if time_number == 1
        suffix = " month #{suffix}"
      else
        suffix = " months #{suffix}"
      end
      
    elsif duration >= SECONDS_IN_ONE_YEAR
      
      time_number = (duration / SECONDS_IN_ONE_YEAR).to_f.floor
      if time_number == 1
        suffix = " year #{suffix}"
      else
        suffix = " years #{suffix}"
      end
      
    end
      
    return "#{prefix}#{time_number}#{suffix}"
    
  end
  
end