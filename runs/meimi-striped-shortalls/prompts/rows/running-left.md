Create one horizontal animation strip for Codex pet `meimi-striped-shortalls`, state `running-left`.

Use the attached canonical base for identity. Use the attached layout guide only for slot count, spacing, centering, and padding; do not draw the guide.

Output exactly 8 full-body frames in one left-to-right row on flat pure green #00FF00. Treat the row as 8 invisible equal-width slots: one centered complete pose per slot, evenly spaced, with no overlap, clipping, empty slots, labels, or borders.

Identity: same pet in every frame: Haneoka Meimi in the same approved non-pixel chibi anime pet style as the previous mint sweater version: warm reddish orange long hair, special Meimi hime-style side locks with narrow roots close to the cheeks and blunt even ends, large glossy eyes, compact full body. Outfit only changes to a gray-and-white horizontal striped long-sleeve T-shirt under bright pink short overalls/shortalls with wide shoulder straps that connect directly to the waist bib, short legs, no hat, no bag.. Preserve silhouette, face, proportions, markings, palette, material, style, and props.
Style: Pet-safe sprite: compact full-body mascot, readable in a 192x208 cell, clear silhouette, simple face, stable palette/materials, and crisp edges for chroma-key extraction. Style `auto`: Infer the most appropriate pet-safe style from the user request and reference images, then keep that exact style consistent across every row. User style notes: Match the previous approved Meimi mint-sweater pet style exactly: clean non-pixel Q-version 1990s shoujo anime look, smooth cel shading, crisp dark outline, transparent-pet production on chroma key, readable inside 192x208 cells. Preserve face, proportions, orange-red hair color, and distinctive narrow-root blunt side locks..
Animation continuity: keep apparent pet scale and baseline stable within the row unless the state itself intentionally changes vertical position, such as `jumping`. Move the pose within the slot instead of redrawing the pet larger or smaller frame to frame.

State action: Dragging-left loop: show directional movement to the left through body and limb poses only.

State requirements:
- Show directional drag movement to the left through body, limb, and prop movement only.
- The row must unmistakably face and travel left.
- The movement cadence must alternate visibly across the 8 frames instead of repeating one nearly static stride.
- Do not draw speed lines, dust clouds, floor shadows, motion trails, or detached motion effects.

Clean extraction: crisp opaque edges, safe padding, no scenery, text, guide marks, checkerboard, shadows, glows, motion blur, speed lines, dust, detached effects, stray pixels, or chroma-key colors inside the pet.
