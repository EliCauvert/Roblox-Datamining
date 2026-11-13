local _ = require("../vendor/compose/core")
local _ = require("./control_types")

return function(p1, p2)
	local function pressed() end
	
	local function fact(Text, Text1)
		-- upvalues: p1 (copy)
		return p1.VStack({
			gap = "xs",
			p1.Text({ textRole = "numeral", text = Text }),
			p1.Text({ textRole = "caption", text = Text1 })
		})
	end
	
	local function record(Text, Text1, Label)
		-- upvalues: p1 (copy)
		return p1.HStack({
			surface = "surface",
			padding = "s",
			gap = "m",
			width = "fill",
			align = "center",
			p1.VStack({
				p1.fill(),
				gap = "xs",
				p1.Text({ textRole = "strong", text = Text }),
				p1.Text({ textRole = "caption", text = Text1 })
			}),
			p1.Badge({ label = Label })
		})
	end
	
	return p1.VStack("Specimen")({
		width = "fill",
		height = "fill",
		surface = "surface",
		padding = "l",
		gap = "l",
		p1.Text({ text = "Title of the screen", textRole = "title" }),
		p1.HStack("Plates")({
			gap = "l",
			wrap = true,
			width = "fill",
			p1.VStack("Type")({
				surface = "panel",
				padding = "m",
				gap = "s",
				width = 360,
				p1.Text({ text = "Heading", textRole = "heading" }),
				p1.HStack({
					gap = "l",
					fact("1,250", "Caption"),
					fact("3rd", "Place")
				}),
				p1.Text({ text = "Strong text", textRole = "strong" }),
				p1.Text({
					text = "Body text reads as a sentence and wraps inside its plate.",
					wrap = true
				}),
				p1.Text({ text = "LABEL", textRole = "label" })
			}),
			p1.VStack("Actions")({
				surface = "panel",
				padding = "m",
				gap = "s",
				width = 300,
				align = "stretch",
				p1.Text({ text = "Actions", textRole = "heading" }),
				p1.Button({
					label = "Main action",
					appearance = "emphasis",
					onActivate = pressed
				}),
				p1.Button({ label = "Action", onActivate = pressed }),
				p1.Button({
					label = "Disabled",
					enabled = false,
					onActivate = pressed
				}),
				p1.Toggle({
					label = "Setting",
					value = p2.cell(true),
					onChange = pressed
				}),
				p1.TextInput({ placeholder = "Field", value = p2.cell("") })
			}),
			p1.VStack("Records")({
				surface = "panel",
				padding = "m",
				gap = "s",
				width = 360,
				p1.Text({ text = "Records", textRole = "heading" }),
				record("First record", "Owned", "Ready"),
				record("Second record", "600 to unlock", "New"),
				p1.Picker({
					style = "segmented",
					selected = p2.cell("one"),
					options = {
						{ value = "one", label = "One" },
						{ value = "two", label = "Two" },
						{ value = "three", label = "Three" }
					}
				})
			})
		})
	})
end