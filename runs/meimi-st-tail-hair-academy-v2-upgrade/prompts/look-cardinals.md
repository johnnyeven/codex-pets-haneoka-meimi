Create one horizontal four-cardinal anchor strip for Codex pet `meimi-st-tail-hair-academy`.

Use the attached canonical base, completed standard contact sheet, and layout guide for exact identity, style, scale, baseline, face construction, materials, palette, markings, props, and spacing. Read `qa/look-mechanics.md` and use the pet's natural gaze mechanism.

Output exactly four centered complete full-body poses in this exact left-to-right order: `000 up`, `090 screen-right`, `180 down`, `270 screen-left`. Screen-left and screen-right always mean the viewer's image edges, never the character's own left or right.

For `000`, keep the face broadly frontal and point the eyes and natural head mechanism toward the TOP edge. For `090`, put the nose tip, pupils, face surface, or natural aiming feature on the screen-right side of the head center. For `180`, keep the face broadly frontal and point toward the BOTTOM edge. For `270`, apply the inverse screen-left landmark rule. Every cardinal must be unmistakable without labels.

Place one pose in each invisible equal-width slot on a flat pure user-selected #00FF00 background with generous padding. Keep scale, feet/base, lower body, and registration consistent across all four slots.

Do not rotate, skew, or tilt the whole sprite to fake gaze. Do not add replacement eyes, labels, degree text, arrows, boxes, guide marks, shadows, scenery, detached effects, or chroma-key colors inside the pet.

REPAIR STRATEGY AFTER FAILED CANDIDATE: preserve the character's asymmetric hairstyle instead of treating right/left poses as mirrored sprites. In every pose, the high side ponytail remains attached on the same physical side shown by the canonical base; it must not jump to the opposite side of the head. In `090 screen-right`, the nose and pupils point screen-right while the ponytail attachment and burgundy bow remain identity-consistent with the canonical base. Keep the entire long curled ponytail well inside that pose's own invisible slot.

SOURCE GEOMETRY HARD GATE: reduce the four poses slightly if needed so each full hairstyle, including the long curled ponytail, has at least 6% pure-green horizontal padding on both sides of its invisible slot and at least 5% pure-green padding above and below. No hair, bow, backpack, limb, or outline may touch or approach a slot boundary.
