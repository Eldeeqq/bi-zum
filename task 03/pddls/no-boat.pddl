(define (problem islands-3)
    (:domain ships)
    (:requirements :strips :typing)
    (:objects forest inn river docks town academy lighthouse sea island - place
              )
(:init
  ; define locations
  (road forest  river)
  (road river forest)

  (road river docks)
  (road docks river)

  (road docks inn)
  (road inn docks)

  (road docks town)
  (road town docks)

  (road town academy)
  (road academy town)
  ; sail
  (sail docks lighthouse)
  (sail lighthouse docks)

  (sail sea docks)
  (sail docks sea)

  (sail sea lighthouse)
  (sail lighthouse sea)

  (sail sea island)
  (sail island sea)

  ; set locations
  (Forest_at forest)
  (Wood_at forest)
  (River_at river)
  (Port_at docks)
  (Inn_at inn)
  (Town_at town)
  (Academy_at academy)
  (Sea_at sea)
  (Island_at island)
  (Lighthouse_at lighthouse)

  ; set attribs
  (at docks)
  (is_weak)
  (is_sober)

  )
  (:goal (and
        (is_happy)
      )
    )
)
