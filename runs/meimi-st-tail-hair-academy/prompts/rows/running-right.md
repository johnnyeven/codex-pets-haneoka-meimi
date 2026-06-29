Create one horizontal animation strip for Codex pet `meimi-st-tail-hair-academy`, state `running-right`.

Use the attached canonical base for identity. Use the attached layout guide only for slot count, spacing, centering, and padding; do not draw the guide.

Output exactly 8 full-body frames in one left-to-right row on flat pure user-selected #00FF00. Treat the row as 8 invisible equal-width slots: one centered complete pose per slot, evenly spaced, with no overlap, clipping, empty slots, labels, or borders.

Identity: same pet in every frame: Haneoka Meimi wearing the original academy uniform while keeping the St. Tail hairstyle. Preserve confirmed base-candidate-04 exactly: red academy jacket, green bow tie, cream/yellow pleated skirt, black knee-high socks, brown ankle boots, backpack straps and backpack, orange-red hair, large burgundy-red bow, high side ponytail that is long, gathered, and curls into a tight rolled tip. Keep the slightly shorter newer slender proportions. No pink casual pinafore, no white shoulder bag, no thief costume, no cane, no gloves, no cape, no dark tights.. Preserve silhouette, face, proportions, markings, palette, material, style, and props.
Style: Pet-safe sprite: compact full-body mascot, readable in a 192x208 cell, clear silhouette, simple face, stable palette/materials, and crisp edges for chroma-key extraction. Style `auto`: Infer the most appropriate pet-safe style from the user request and reference images, then keep that exact style consistent across every row. User style notes: Non-pixel 1990s shoujo anime Q-version pet, smooth cel shading, crisp dark outline, compact readable full-body sprite. Preserve the confirmed academy-uniform plus St. Tail curled ponytail identity across all rows..
Animation continuity: keep apparent pet scale and baseline stable within the row unless the state itself intentionally changes vertical position, such as `jumping`. Move the pose within the slot instead of redrawing the pet larger or smaller frame to frame.

State action: Dragging-right loop: show directional movement to the right through body and limb poses only.

State requirements:
- Show directional drag movement to the right through body, limb, and prop movement only.
- The row must unmistakably face and travel right.
- The movement cadence must alternate visibly across the 8 frames instead of repeating one nearly static stride.
- Do not draw speed lines, dust clouds, floor shadows, motion trails, or detached motion effects.

Clean extraction: crisp opaque edges, safe padding, no scenery, text, guide marks, checkerboard, shadows, glows, motion blur, speed lines, dust, detached effects, stray pixels, or chroma-key colors inside the pet.
