(define (domain ships)
    (:requirements :strips :typing)
    (:types place)
    (:predicates
  ; positional
    (at ?where)
    (road ?from ?to)
    (sail ?from ?to)
    (Wood_at ?at)
    (Boat_at ?at)
    (Forest_at ?at)
    (Port_at ?at)
    (River_at ?at)
    (Town_at ?at)
    (Inn_at ?at)
    (Academy_at ?at)
    (Sea_at ?at)
    (Island_at ?at)
    (Lighthouse_at ?at)

  ; items
    (has_gold_nugget)
    (has_gold_coin)
    (has_gold_brick)
    (has_wood)
    (has_boat)
    (has_frigate)
    (has_caravel)
    (has_alcohol)
    (has_cocoa)
    (has_pearl)

    (has_bear_skin)
    (has_map)
    (has_coke)
    (has_flowers)
    (has_ring)
    (has_bride)
    (has_connections_shady)
    (has_connections_good)

  ; stats
    (is_criminal)
    (is_sober)
    (is_mellow)
    (is_drunk)
    (is_addict)
    (is_strong)
    (is_weak)
    (is_captain)
    (is_happy)
    (is_bear_killer)
    (is_friend_with_smuglers)
    (is_pirate_defeater)
  )
  ; ------- actions -------
  ; # MOVE
  ; walk
  (:action walk
      :parameters (?from - place ?to - place)
      :precondition (and
        (at ?from)
        (road ?from ?to)
      )
      :effect (and
        (at ?to)
        (not (at ?from))
      )
   )
  (:action sail_boat
    :parameters (?from - place ?to - place)
    :precondition(and
      (at ?from)
      (sail ?from ?to)
      (has_boat)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
   )
  (:action sail_caravel
    :parameters (?from - place ?to - place)
    :precondition(and
      (at ?from)
      (sail ?from ?to)
      (has_caravel)
    )
    :effect (and
      (at ?to)
      (not (at ?from))
    )
   )
  (:action sail_frigate
    :parameters (?from - place ?to - place)
    :precondition(and
      (at ?from)
      (sail ?from ?to)
      (has_frigate)
    )
    :effect (and
      (at ?to)
      (not (at ?from))
    )
   )
  ; # END MOVE

  ; # CRAFT
  (:action craft_boat
    :parameters ()
    :precondition (and
      (has_wood)
    )
    :effect(and
      (has_boat)
      (not (has_wood))
    )
   )
  (:action craft_frigate
    :parameters ()
    :precondition (and
      (has_wood)
      (has_gold_nugget)
      (has_boat)
    )
    :effect(and
      (has_frigate)
      (not (has_wood))
      (not (has_gold_nugget))
      (not (has_boat))
    )
   )
  (:action craft_caravel
    :parameters ()
    :precondition (and
      (has_wood)
      (has_gold_coin)
      (has_boat)
    )
    :effect(and
      (has_frigate)
      (not (has_wood))
      (not (has_gold_coin))
      (not (has_boat))
    )
   )
  ; # END CRAFT

  ; # OBTAIN ITEMS
  (:action obtain_wood
    :parameters (?at - place)
    :precondition (and
      (at ?at)
      (Wood_at ?at)
    )
    :effect(and
      (has_wood)
    )
   )
  (:action obtain_map
    :parameters (?at - place)
    :precondition(and
      (at ?at)
      (Forest_at ?at)
      (has_alcohol)
    )
    :effect(and
      (not (has_alcohol))
      ;(has_map)
      (has_connections_shady)
    )
   )
  (:action obtain_bear_skin
   :parameters (?at - place)
   :precondition(and
     (at ?at)
     (Forest_at ?at)
     )
   :effect (and
      (not(is_weak))
      (is_bear_killer)
      (has_bear_skin)
     )
   )
  (:action obtain_flowers
   :parameters(?at - place)
   :precondition(and
     (at ?at)
     (Forest_at ?at)
     )
   :effect (and
      (has_flowers)
     )
   )
  (:action obtain_boat_by_stealing
    :parameters (?at - place)
    :precondition(and
      (at ?at)
      (Boat_at ?at)
    )
    :effect(and
      (has_boat)
      (is_criminal)

    )
   )
  (:action obtain_gold_nugget
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (River_at ?at)
    )
    :effect (and
        (has_gold_nugget)
        )
   )
  (:action obtain_gold_coin
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Town_at ?at)
        (has_gold_nugget)
    )
    :effect (and
        (not (has_gold_nugget))
        (has_gold_coin)
        (has_connections_good)
        )
    )
  (:action obtain_gold_brick
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Town_at ?at)
        (has_gold_coin)
    )
    :effect (and
        (not (has_gold_coin))
        (has_gold_brick)
        (has_connections_good)
        )
    )
  (:action obtain_cocoa
    :parameters (?at - place)
    :precondition (and
      (at ?at)
      (Island_at ?at)
      )
    :effect (and
      (has_cocoa)
      )
    )
  (:action obtain_pearl
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Sea_at ?at)
      )
    :effect (and
        (has_pearl)
      )
    )
  (:action obtain_ring
    :parameters ()
    :precondition(and
        (has_pearl)
        (has_gold_brick)
      )
    :effect(and
      (not (has_pearl))
      (not (has_gold_brick))
      (has_ring)
      )
    )
  (:action obtain_coke
    :parameters (?at - place)
    :precondition (and
      (at ?at)
      (Island_at ?at)
      (has_map)
      )
    :effect (and
      (has_coke)
      )
    )
  (:action obtain_alcohol
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Inn_at ?at)
        (has_gold_nugget)
      )
    :effect (and
        (has_alcohol)
        (not (has_gold_nugget))
      )
    )
  ; # END OBTIN ITEMS

  ; # ACTIONS
  (:action drink_first_round
    :parameters ()
    :precondition (and
        (has_alcohol)
        (is_sober)
    )
    :effect(and
      (is_mellow)
      (not (is_sober))
      (not (has_alcohol))
    )
   )
  (:action drink_second_round
    :parameters ()
    :precondition (and
        (has_alcohol)
        (is_mellow)
    )
    :effect(and
      (is_drunk)
      (not (is_mellow))
      (not (has_alcohol))
    )
   )
  (:action drink_third_round
    :parameters ()
    :precondition (and
        (has_alcohol)
        (is_drunk)
    )
    :effect(and
      (is_addict)
      (not (is_drunk))
      (not (has_alcohol))
    )
   )
  (:action cleanse_in_river
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (River_at ?at)
      )
    :effect (and
      (not (is_drunk))
      (not (is_mellow))
      (is_sober)
      )
   )
  (:action cleanse_in_sea
     :parameters (?at - place)
     :precondition (and
         (at ?at)
         (Sea_at ?at)
       )
     :effect (and
       (not (is_drunk))
       (not (is_mellow))
       (is_sober)
       )
    )
  (:action study_for_captain
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Academy_at ?at)
        (has_gold_coin)
        (not (is_criminal))
      )
    :effect (and
        (not (has_gold_coin))
        (is_captain)
      )
    )
  (:action work_for_gold
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Port_at ?at)
      )
    :effect(and
      (has_gold_nugget)
      )
    )
  (:action trade_cocoa
    :parameters (?at - place)
    :precondition (and
          (at ?at)
          (Port_at ?at)
          (has_cocoa)
      )
    :effect (and
        (has_gold_coin)
        (not (has_cocoa))
      )
    )
  (:action trade_bear_skin
    :parameters (?at - place)
    :precondition (and
          (at ?at)
          (Port_at ?at)
          (has_bear_skin)
      )
    :effect (and
        (has_gold_coin)
        (not (has_bear_skin))
      )
    )
  (:action befriend_smugglers
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Port_at ?at)
        (has_connections_shady)
        (has_gold_brick)
    )
    :effect (and
        (is_friend_with_smuglers)
        )
    )
  (:action buy_round
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Inn_at ?at)
        (has_gold_coin)
      )
    :effect (and
        (has_connections_good)
        (not (has_gold_coin))
      )
    )
  (:action brawl_in_inn
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Inn_at ?at)
        (is_mellow)
      )
    :effect (and
        (not(is_weak))
      )
    )
  (:action steal_coin
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Town_at ?at)
    )
    :effect (and
        (has_gold_coin)
        (is_criminal)
        )
    )
  (:action buy_pardon
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Town_at ?at)
        (has_gold_nugget)
        (is_criminal)
    )
    :effect (and
        (not (is_criminal))
        (not (has_gold_nugget))
        )
    )
  (:action work_pardon
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Town_at ?at)
        (is_criminal)
    )
    :effect (and
        (not (is_criminal))
        (is_mellow)
        )
    )
  (:action join_pirates
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Sea_at ?at)
        (has_connections_shady)
    )
    :effect (and
        (is_mellow)
        )
   )
  (:action get_robbed_by_pirates
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Sea_at ?at)
        (is_weak)
    )
    :effect (and
        (not (has_frigate))
        (not (has_caravel))
        (not (has_gold_coin))
        (not (has_gold_nugget))
        (not (has_gold_brick))
        (not (is_weak))
        )
    )
  (:action defeat_pirates
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Sea_at ?at)
        (not (is_weak))
        (has_caravel)
    )
    :effect (and
        (has_boat)
        (has_frigate)
        (has_caravel)
        (has_gold_coin)
        (has_gold_nugget)
        (has_gold_brick)
        (is_pirate_defeater)
        )
    )
  (:action propose_as_bear_slayer
   :parameters (?at - place)
   :precondition (and
       (at ?at)
       (Lighthouse_at ?at)
       (has_ring)
       (has_flowers)
       (is_bear_killer)
     )
   :effect (and
        (has_bride)
     )
    )
  (:action propose_as_pirate_defeater
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Lighthouse_at ?at)
        (has_ring)
        (has_flowers)
        (is_pirate_defeater)
      )
    :effect (and
         (has_bride)
      )
    )
  (:action propose_as_captain
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Lighthouse_at ?at)
        (has_ring)
        (has_flowers)
        (is_captain)
      )
    :effect (and
         (has_bride)
      )
    )
  ; # END ACTIONS

  ; # FINAL STATES
  (:action become_married
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Island_at ?at)
        (has_bride)
        (has_connections_good)
        (not (is_criminal))
        (is_sober)
    )
    :effect (and
        (is_happy)
        )
    )
  (:action become_admiral
    :parameters (?at - place)
    :precondition (and
        (at ?at)
        (Academy_at ?at)
        (is_captain)
        (is_pirate_defeater)
        (is_sober)
    )
    :effect (and
        (is_happy)
      )
    )
  (:action become_drug_addict
    :parameters ()
    :precondition (and
        (has_coke)
        (has_frigate)
        (has_gold_brick)
        (is_friend_with_smuglers)
    )
    :effect (and
        (is_happy)
        )
    )
  ; # END FINAL STATES

)
