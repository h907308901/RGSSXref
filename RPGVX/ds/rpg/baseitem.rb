module RPG
  class BaseItem
    def initialize
      @id = 0
      @name = ""
      @icon_index = 0
      @description = ""
      @note = ""
    end
    attr_accessor :id
    attr_accessor :name
    attr_accessor :icon_index
    attr_accessor :description
    attr_accessor :note
  end
end

module RPG
  class UsableItem < BaseItem
    def initialize
      super
      @scope = 0
      @occasion = 0
      @speed = 0
      @animation_id = 0
      @common_event_id = 0
      @base_damage = 0
      @variance = 20
      @atk_f = 0
      @spi_f = 0
      @physical_attack = false
      @damage_to_mp = false
      @absorb_damage = false
      @ignore_defense = false
      @element_set = []
      @plus_state_set = []
      @minus_state_set = []
    end
    def for_opponent?
      return [1, 2, 3, 4, 5, 6].include?(@scope)
    end
    def for_friend?
      return [7, 8, 9, 10, 11].include?(@scope)
    end
    def for_dead_friend?
      return [9, 10].include?(@scope)
    end
    def for_user?
      return [11].include?(@scope)
    end
    def for_one?
      return [1, 3, 4, 7, 9, 11].include?(@scope)
    end
    def for_two?
      return [5].include?(@scope)
    end
    def for_three?
      return [6].include?(@scope)
    end
    def for_random?
      return [4, 5, 6].include?(@scope)
    end
    def for_all?
      return [2, 8, 10].include?(@scope)
    end
    def dual?
      return [3].include?(@scope)
    end
    def need_selection?
      return [1, 3, 7, 9].include?(@scope)
    end
    def battle_ok?
      return [0, 1].include?(@occasion)
    end
    def menu_ok?
      return [0, 2].include?(@occasion)
    end
    attr_accessor :scope
    attr_accessor :occasion
    attr_accessor :speed
    attr_accessor :animation_id
    attr_accessor :common_event_id
    attr_accessor :base_damage
    attr_accessor :variance
    attr_accessor :atk_f
    attr_accessor :spi_f
    attr_accessor :physical_attack
    attr_accessor :damage_to_mp
    attr_accessor :absorb_damage
    attr_accessor :ignore_defense
    attr_accessor :element_set
    attr_accessor :plus_state_set
    attr_accessor :minus_state_set
  end
end

module RPG
  class Skill < UsableItem
    def initialize
      super
      @scope = 1
      @mp_cost = 0
      @hit = 100
      @message1 = ""
      @message2 = ""
    end
    attr_accessor :mp_cost
    attr_accessor :hit
    attr_accessor :message1
    attr_accessor :message2
  end
end

module RPG
  class Item < UsableItem
    def initialize
      super
      @scope = 7
      @price = 0
      @consumable = true
      @hp_recovery_rate = 0
      @hp_recovery = 0
      @mp_recovery_rate = 0
      @mp_recovery = 0
      @parameter_type = 0
      @parameter_points = 0
    end
    attr_accessor :price
    attr_accessor :consumable
    attr_accessor :hp_recovery_rate
    attr_accessor :hp_recovery
    attr_accessor :mp_recovery_rate
    attr_accessor :mp_recovery
    attr_accessor :parameter_type
    attr_accessor :parameter_points
  end
end

module RPG
  class Weapon < BaseItem
    def initialize
      super
      @animation_id = 0
      @price = 0
      @hit = 95
      @atk = 0
      @def = 0
      @spi = 0
      @agi = 0
      @two_handed = false
      @fast_attack = false
      @dual_attack = false
      @critical_bonus = false
      @element_set = []
      @state_set = []
    end
    attr_accessor :animation_id
    attr_accessor :price
    attr_accessor :hit
    attr_accessor :atk
    attr_accessor :def
    attr_accessor :spi
    attr_accessor :agi
    attr_accessor :two_handed
    attr_accessor :fast_attack
    attr_accessor :dual_attack
    attr_accessor :critical_bonus
    attr_accessor :element_set
    attr_accessor :state_set
  end
end

module RPG
  class Armor < BaseItem
    def initialize
      super
      @kind = 0
      @price = 0
      @eva = 0
      @atk = 0
      @def = 0
      @spi = 0
      @agi = 0
      @prevent_critical = false
      @half_mp_cost = false
      @double_exp_gain = false
      @auto_hp_recover = false
      @element_set = []
      @state_set = []
    end
    attr_accessor :kind
    attr_accessor :price
    attr_accessor :eva
    attr_accessor :atk
    attr_accessor :def
    attr_accessor :spi
    attr_accessor :agi
    attr_accessor :prevent_critical
    attr_accessor :half_mp_cost
    attr_accessor :double_exp_gain
    attr_accessor :auto_hp_recover
    attr_accessor :element_set
    attr_accessor :state_set
  end
end
