Create one horizontal animation strip for Codex pet `meimi-st-tail-hair-academy`, state `waiting`.

Use the attached canonical base for identity. Use the attached layout guide only for slot count, spacing, centering, and padding; do not draw the guide.

Output exactly 6 full-body frames in one left-to-right row on flat pure user-selected #00FF00. Treat the row as 6 invisible equal-width slots: one centered complete pose per slot, evenly spaced, with no overlap, clipping, empty slots, labels, or borders.

Identity: same pet in every frame: Preserve the approved existing pet exactly: Haneoka Meimi in red academy jacket, green bow, cream-yellow pleated skirt, black knee-high socks, brown ankle boots, backpack straps and backpack, orange-red hair, large burgundy bow, and long high side ponytail ending in a tight rolled curl. Upgrade only by adding natural 16-direction looking poses; preserve face, proportions, palette, outfit, hairstyle, backpack, linework and cel shading. No thief costume, cane, gloves, cape, shoulder bag, text, detached effects, shadows, or scenery.. Preserve silhouette, face, proportions, markings, palette, material, style, and props.
Style: Pet-safe sprite: compact full-body mascot, readable in a 192x208 cell, clear silhouette, simple face, stable palette/materials, and crisp edges for chroma-key extraction. Style `auto`: Infer the most appropriate pet-safe style from the user request and reference images, then keep that exact style consistent across every row. User style notes: Non-pixel 1990s shoujo anime chibi pet, smooth cel shading, crisp dark outlines. Match the existing atlas exactly..
Animation continuity: keep apparent pet scale and baseline stable within the row unless the state itself intentionally changes vertical position, such as `jumping`. Move the pose within the slot instead of redrawing the pet larger or smaller frame to frame.

State action: Needs-input loop: expectant asking pose for approval, help, or user input.

State requirements:
- Show that Codex needs approval, help, or user input through an expectant asking pose.
- Keep the motion patient and readable, without turning it into ordinary idle or review.

Clean extraction: crisp opaque edges, safe padding, no scenery, text, guide marks, checkerboard, shadows, glows, motion blur, speed lines, dust, detached effects, stray pixels, or chroma-key colors inside the pet.
