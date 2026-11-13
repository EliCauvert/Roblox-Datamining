local _ = require("./types")

local function _(Kind, Props, Children)
	return { kind = Kind, props = Props, children = Children }
end

local function nativeFields(Order: number, p1)
	p1.BackgroundColor3 = {
		type = "color",
		label = "Background color",
		format = "color",
		order = Order
	}
	p1.BackgroundTransparency = {
		type = "number",
		label = "Background transparency",
		order = Order + 1
	}
	p1.Visible = { type = "boolean", label = "Visible", order = Order + 2 }
	p1.Rotation = { type = "number", label = "Rotation", order = Order + 3 }
	p1.ClipsDescendants = {
		type = "boolean",
		label = "Clip contents",
		order = Order + 4
	}
	p1.LayoutOrder = {
		type = "number",
		label = "Layout order",
		order = Order + 5
	}
	
	return p1
end

return {
	AdaptiveStack = {
		category = "Layout",
		container = true,
		defaults = { gap = "s" },
		fields = nativeFields(6, {
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			gap = {
				type = "choice",
				label = "Spacing",
				order = 3,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 4,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end", "stretch" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			maxHeight = { type = "number", label = "Maximum height", order = 17 },
			distribute = {
				type = "choice",
				label = "Distribution",
				order = 13,
				options = {
					"start", "center", "end", "spaceBetween", "spaceAround", "spaceEvenly"
				}
			},
			axis = {
				type = "choice",
				label = "Axis",
				order = 14,
				options = { "x", "y" }
			}
		})
	},
	Alert = {
		category = "Overlays",
		state = "isPresented",
		defaults = {
			isPresented = true,
			message = "Make this moment yours.",
			severity = "information",
			title = "Ready to continue?",
			actions = { { id = "okay", label = "Continue" } }
		},
		fields = nativeFields(8, {
			isPresented = { type = "boolean", label = "Presented", order = 1 },
			title = { type = "string", label = "Title", order = 2 },
			message = { type = "string", label = "Message", order = 3 },
			actions = {
				type = "value",
				label = "Actions",
				order = 4,
				format = "json"
			},
			severity = {
				type = "choice",
				label = "Severity",
				order = 5,
				options = { "information", "warning", "critical" }
			},
			surface = {
				type = "choice",
				label = "Surface",
				order = 6,
				options = { "dialog", "fullScreen" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 7 },
			icon = { type = "string", label = "Icon", order = 14 },
			padding = { type = "number", label = "Padding", order = 15 }
		})
	},
	AsyncImage = {
		category = "Content",
		nativeSize = true,
		defaults = {
			failureLabel = "Image unavailable",
			height = 140,
			source = "rbxassetid://0",
			width = 240
		},
		fields = nativeFields(7, {
			source = { type = "string", label = "Image URI", order = 1 },
			failureLabel = { type = "string", label = "Failure label", order = 2 },
			dimmed = { type = "boolean", label = "Dimmed", order = 3 },
			width = { type = "number", label = "Width", order = 4 },
			height = { type = "number", label = "Height", order = 5 },
			imageProperties = {
				type = "value",
				label = "Image properties",
				order = 6,
				format = "json"
			}
		})
	},
	Avatar = {
		category = "Content",
		defaults = { diameter = 52, name = "Alex", presence = "online" },
		fields = nativeFields(9, {
			name = { type = "string", label = "Name", order = 1 },
			image = { type = "string", label = "Image URI", order = 2 },
			userId = { type = "number", label = "User ID", order = 3 },
			presence = {
				type = "choice",
				label = "Presence",
				order = 4,
				options = {
					"online",
					"away",
					"busy",
					"offline",
					"inExperience"
				}
			},
			diameter = { type = "number", label = "Diameter", order = 5 },
			presenceMark = { type = "boolean", label = "Presence mark", order = 6 },
			form = {
				type = "choice",
				label = "Form",
				order = 7,
				options = { "standard", "icon" }
			},
			icon = { type = "string", label = "Icon", order = 8 },
			presenceLabel = { type = "string", label = "Presence label", order = 15 },
			backplate = { type = "boolean", label = "Backplate", order = 16 },
			background = {
				type = "choice",
				label = "Background role",
				order = 17,
				options = {
					"surface", "surfaceStrong", "control", "contentStrong", "accent", "success",
					"warning", "danger"
				}
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 18,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	AvatarGroup = {
		category = "Content",
		defaults = {
			diameter = 40,
			max = 3,
			items = {
				{ id = "alex", name = "Alex" },
				{ id = "sam", name = "Sam" },
				{ id = "jo", name = "Jo" }
			}
		},
		fields = nativeFields(6, {
			items = {
				type = "value",
				label = "People",
				order = 1,
				format = "json"
			},
			max = { type = "number", label = "Maximum visible", order = 2 },
			diameter = { type = "number", label = "Diameter", order = 3 },
			layout = {
				type = "choice",
				label = "Layout",
				order = 4,
				options = { "stacked", "spread" }
			},
			overflow = {
				type = "choice",
				label = "Overflow",
				order = 5,
				options = { "count", "ellipsis" }
			},
			form = {
				type = "choice",
				label = "Form",
				order = 12,
				options = { "standard", "icon" }
			},
			overflowLabel = { type = "string", label = "Overflow label", order = 13 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 14,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Badge = {
		category = "Status",
		defaults = { label = "NEW", status = "success" },
		fields = nativeFields(3, {
			label = { type = "string", label = "Label", order = 1 },
			status = {
				type = "choice",
				label = "Status",
				order = 2,
				options = {
					"neutral", "info", "success", "warning", "error", "accent"
				}
			},
			icon = { type = "string", label = "Icon", order = 9 },
			iconPosition = {
				type = "choice",
				label = "Icon position",
				order = 10,
				options = { "leading", "trailing" }
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 11,
				options = { "standard", "status", "utility" }
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 12,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Button = {
		category = "Input",
		container = true,
		seeds = {},
		defaults = { appearance = "emphasis", label = "Continue" },
		fields = nativeFields(6, {
			label = { type = "string", label = "Label", order = 1 },
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 2,
				options = {
					"standard", "emphasis", "soft", "utility", "link", "inverse"
				}
			},
			enabled = { type = "boolean", label = "Enabled", order = 3 },
			icon = { type = "string", label = "Icon", order = 4 },
			corners = {
				type = "choice",
				label = "Corners",
				order = 5,
				options = { "pill", "square" }
			},
			subtitle = { type = "string", label = "Subtitle", order = 12 },
			hint = { type = "string", label = "Hint", order = 13 },
			trailingIcon = { type = "string", label = "Trailing icon", order = 14 },
			image = { type = "string", label = "Image URI", order = 15 },
			imageAspectRatio = { type = "number", label = "Image ratio", order = 16 },
			imageFraming = {
				type = "choice",
				label = "Image framing",
				order = 17,
				options = { "fit", "crop" }
			},
			compactLabel = { type = "string", label = "Compact label", order = 18 },
			busy = { type = "boolean", label = "Busy", order = 19 },
			shape = {
				type = "choice",
				label = "Shape",
				order = 20,
				options = { "rect", "circle" }
			},
			role = {
				type = "choice",
				label = "Role",
				order = 21,
				options = { "default", "cancel", "destructive", "onIndicator" }
			},
			disclose = {
				type = "boolean",
				label = "Disclosure indicator",
				order = 22
			},
			textSize = { type = "number", label = "Text size", order = 23 },
			help = {
				type = "value",
				label = "Help",
				order = 24,
				format = "json"
			},
			cooldown = {
				type = "value",
				label = "Cooldown",
				order = 35,
				format = "json"
			},
			charges = { type = "number", label = "Charges", order = 36 },
			MouseEnter = { type = "event", label = "Pointer entered", order = 37 },
			MouseLeave = { type = "event", label = "Pointer left", order = 38 },
			SelectionGained = { type = "event", label = "Focus gained", order = 39 },
			row = {
				type = "value",
				label = "Row content",
				order = 25,
				format = "json"
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 26,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Callout = {
		category = "Overlays",
		container = true,
		content = "content",
		state = "isPresented",
		anchor = "anchor",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			anchorLabel = "Explore",
			closeButton = true,
			isPresented = true,
			title = "A new possibility"
		},
		fields = nativeFields(7, {
			isPresented = { type = "boolean", label = "Presented", order = 1 },
			title = { type = "string", label = "Title", order = 2 },
			anchorLabel = { type = "string", label = "Anchor label", order = 3 },
			closeButton = { type = "boolean", label = "Close button", order = 4 },
			edge = {
				type = "choice",
				label = "Edge",
				order = 5,
				options = { "top", "bottom" }
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 6,
				options = { "leading", "center", "trailing" }
			},
			dismissLabel = { type = "string", label = "Dismiss label", order = 13 },
			priority = { type = "number", label = "Priority", order = 14 },
			seen = { type = "boolean", label = "Seen", order = 15 },
			featureUsed = { type = "boolean", label = "Feature used", order = 16 },
			sessions = { type = "number", label = "Sessions", order = 17 },
			afterSessions = {
				type = "number",
				label = "Show after sessions",
				order = 18
			},
			steps = {
				type = "value",
				label = "Step progress",
				order = 19,
				format = "json"
			},
			media = {
				type = "value",
				label = "Media",
				order = 20,
				format = "json"
			},
			actions = {
				type = "value",
				label = "Actions",
				order = 21,
				format = "json"
			}
		})
	},
	Card = {
		category = "Content",
		container = true,
		content = "artwork",
		defaults = {
			caption = "Your next adventure starts here.",
			image = "rbxassetid://0",
			imageAspectRatio = 1.6,
			title = "A place worth discovering"
		},
		fields = nativeFields(8, {
			title = { type = "string", label = "Title", order = 1 },
			caption = { type = "string", label = "Caption", order = 2 },
			image = { type = "string", label = "Image URI", order = 3 },
			imageAspectRatio = { type = "number", label = "Artwork ratio", order = 4 },
			imageFraming = {
				type = "choice",
				label = "Image framing",
				order = 5,
				options = { "fit", "crop" }
			},
			reveal = {
				type = "choice",
				label = "Reveal",
				order = 6,
				options = { "automatic", "always" }
			},
			enabled = { type = "boolean", label = "Enabled", order = 7 },
			primaryAction = {
				type = "value",
				label = "Primary action",
				order = 14,
				format = "json"
			},
			menu = {
				type = "value",
				label = "Menu",
				order = 15,
				format = "json"
			},
			ringTarget = {
				type = "choice",
				label = "Focus ring target",
				order = 16,
				options = { "card", "media" }
			}
		})
	},
	CellEditor = {
		category = "Collections",
		state = "value",
		defaults = { editor = "text", value = "Name" },
		fields = nativeFields(4, {
			editor = {
				type = "choice",
				label = "Editor",
				order = 1,
				options = { "text" }
			},
			value = { type = "string", label = "Initial text", order = 2 },
			label = { type = "string", label = "Field label", order = 3 }
		})
	},
	Chip = {
		category = "Input",
		state = "selected",
		defaults = { label = "Adventure", selected = false },
		fields = nativeFields(4, {
			label = { type = "string", label = "Label", order = 1 },
			icon = { type = "string", label = "Icon", order = 2 },
			selected = { type = "boolean", label = "Selected", order = 3 },
			subtitle = { type = "string", label = "Subtitle", order = 10 },
			hint = { type = "string", label = "Hint", order = 11 },
			trailingIcon = { type = "string", label = "Trailing icon", order = 12 },
			image = { type = "string", label = "Image URI", order = 13 },
			imageAspectRatio = { type = "number", label = "Image ratio", order = 14 },
			imageFraming = {
				type = "choice",
				label = "Image framing",
				order = 15,
				options = { "fit", "crop" }
			},
			compactLabel = { type = "string", label = "Compact label", order = 16 },
			busy = { type = "boolean", label = "Busy", order = 17 },
			enabled = { type = "boolean", label = "Enabled", order = 18 },
			shape = {
				type = "choice",
				label = "Shape",
				order = 19,
				options = { "rect", "circle" }
			},
			role = {
				type = "choice",
				label = "Role",
				order = 20,
				options = { "default", "cancel", "destructive", "onIndicator" }
			},
			disclose = {
				type = "boolean",
				label = "Disclosure indicator",
				order = 21
			},
			textSize = { type = "number", label = "Text size", order = 22 },
			help = { type = "string", label = "Help", order = 23 },
			row = {
				type = "value",
				label = "Row content",
				order = 24,
				format = "json"
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 25,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	CollapsibleView = {
		category = "Navigation",
		container = true,
		content = "content",
		state = "expanded",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = { expanded = false, label = "Expand content" },
		fields = nativeFields(5, {
			label = { type = "string", label = "Label", order = 1 },
			expanded = { type = "boolean", label = "Expanded", order = 2 },
			dismissButton = { type = "boolean", label = "Dismiss button", order = 3 },
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 4,
				options = { "standard", "emphasis", "soft", "utility" }
			}
		})
	},
	ColorPicker = {
		category = "Input",
		state = "value",
		defaults = {
			label = "Accent color",
			style = "automatic",
			value = "#3B82F6"
		},
		fields = nativeFields(8, {
			value = {
				type = "color",
				label = "Initial color",
				order = 1,
				format = "color"
			},
			label = { type = "string", label = "Label", order = 2 },
			style = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = { "automatic", "inline" }
			},
			draft = { type = "boolean", label = "Apply and cancel", order = 4 },
			alpha = { type = "number", label = "Alpha", order = 5 },
			readOnly = { type = "boolean", label = "Read only", order = 6 },
			modes = {
				type = "value",
				label = "Modes",
				order = 7,
				format = "json"
			},
			enabled = { type = "boolean", label = "Enabled", order = 14 },
			hint = { type = "string", label = "Hint", order = 15 },
			errorText = { type = "string", label = "Error text", order = 16 },
			requiredMark = {
				type = "choice",
				label = "Requirement",
				order = 17,
				options = { "required", "optional" }
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 18,
				options = { "standard", "contrast", "utility" }
			},
			corners = {
				type = "choice",
				label = "Corners",
				order = 19,
				options = { "pill", "square" }
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 20,
				options = { "xsmall", "compact", "regular", "large" }
			},
			allowEmpty = { type = "boolean", label = "Allow empty", order = 21 },
			placeholder = { type = "string", label = "Placeholder", order = 22 }
		})
	},
	ComboBox = {
		category = "Navigation",
		states = { "value", "text" },
		defaults = {
			placeholder = "Choose or type",
			text = "First option",
			value = "first",
			options = {
				{ label = "First option", value = "first" },
				{ label = "Second option", value = "second" }
			}
		},
		fields = nativeFields(6, {
			value = { type = "string", label = "Initial value", order = 1 },
			text = { type = "string", label = "Initial text", order = 2 },
			options = {
				type = "value",
				label = "Options",
				order = 3,
				format = "json"
			},
			placeholder = { type = "string", label = "Placeholder", order = 4 },
			commitOnFocusLost = { type = "boolean", label = "Commit on blur", order = 5 },
			enabled = { type = "boolean", label = "Enabled", order = 12 }
		})
	},
	Composition = {
		category = "Layout",
		container = true,
		seeds = {
			{
				kind = "Region",
				props = { rank = 1, zone = "center" },
				children = {
					{
						kind = "Text",
						props = { text = "Make this content yours", wrap = true },
						children = {}
					}
				}
			}
		},
		defaults = { gap = "m", padding = "m" },
		fields = nativeFields(4, {
			gap = {
				type = "choice",
				label = "Gap",
				order = 1,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 2,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			topbar = { type = "boolean", label = "Top bar", order = 3 }
		})
	},
	DateTimePicker = {
		category = "Input",
		state = "value",
		defaults = {
			label = "Date",
			style = "automatic",
			value = {
				day = 30,
				hour = 0,
				minute = 0,
				month = 9,
				year = 2026
			}
		},
		fields = nativeFields(10, {
			value = {
				type = "value",
				label = "Initial civil date",
				order = 1,
				format = "json"
			},
			label = { type = "string", label = "Label", order = 2 },
			style = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = { "automatic", "inline" }
			},
			time = { type = "boolean", label = "Include time", order = 4 },
			draft = { type = "boolean", label = "Apply and cancel", order = 5 },
			minuteStep = { type = "number", label = "Minute step", order = 6 },
			weekStart = { type = "number", label = "Week starts", order = 7 },
			min = {
				type = "value",
				label = "Earliest date",
				order = 8,
				format = "json"
			},
			max = {
				type = "value",
				label = "Latest date",
				order = 9,
				format = "json"
			},
			enabled = { type = "boolean", label = "Enabled", order = 16 },
			readOnly = { type = "boolean", label = "Read only", order = 17 },
			hint = { type = "string", label = "Hint", order = 18 },
			errorText = { type = "string", label = "Error text", order = 19 },
			requiredMark = {
				type = "choice",
				label = "Requirement",
				order = 20,
				options = { "required", "optional" }
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 21,
				options = { "standard", "contrast", "utility" }
			},
			corners = {
				type = "choice",
				label = "Corners",
				order = 22,
				options = { "pill", "square" }
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 23,
				options = { "xsmall", "compact", "regular", "large" }
			},
			hourCycle = {
				type = "number",
				label = "Hour cycle",
				order = 24,
				default = 12
			},
			placeholder = { type = "string", label = "Placeholder", order = 25 },
			referenceDate = {
				type = "value",
				label = "Reference date",
				order = 26,
				format = "json"
			},
			locale = {
				type = "value",
				label = "Date words",
				order = 27,
				format = "json"
			}
		})
	},
	Dialog = {
		category = "Overlays",
		container = true,
		content = "content",
		state = "isPresented",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			actionLabel = "Continue",
			closeButton = true,
			isPresented = true,
			title = "Make it yours"
		},
		fields = nativeFields(7, {
			isPresented = { type = "boolean", label = "Presented", order = 1 },
			title = { type = "string", label = "Title", order = 2 },
			actionLabel = { type = "string", label = "Action label", order = 3 },
			closeButton = { type = "boolean", label = "Close button", order = 4 },
			width = {
				type = "choice",
				label = "Width",
				order = 5,
				options = { "automatic", "narrow", "wide" }
			},
			actionLayout = {
				type = "choice",
				label = "Action layout",
				order = 6,
				options = { "automatic", "row", "stacked" }
			},
			actions = {
				type = "value",
				label = "Actions",
				order = 13,
				format = "json"
			},
			contentSelectable = {
				type = "boolean",
				label = "Selectable content",
				order = 14
			},
			hero = {
				type = "value",
				label = "Hero image",
				order = 15,
				format = "json"
			},
			presentation = {
				type = "choice",
				label = "Presentation",
				order = 16,
				options = { "automatic", "inset" }
			},
			bodyHeight = {
				type = "choice",
				label = "Body height",
				order = 17,
				options = { "fill" }
			}
		})
	},
	DisclosureGroup = {
		category = "Navigation",
		container = true,
		content = "content",
		state = "expanded",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			appearance = "contained",
			expanded = true,
			label = "More details"
		},
		fields = nativeFields(6, {
			label = { type = "string", label = "Label", order = 1 },
			description = { type = "string", label = "Description", order = 2 },
			expanded = { type = "boolean", label = "Expanded", order = 3 },
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 4,
				options = { "plain", "contained", "divided", "outline" }
			},
			chevronPosition = {
				type = "choice",
				label = "Chevron position",
				order = 5,
				options = { "leading", "trailing" }
			},
			enabled = { type = "boolean", label = "Enabled", order = 12 },
			icon = { type = "string", label = "Icon", order = 13 },
			textSize = { type = "number", label = "Text size", order = 14 },
			indent = {
				type = "choice",
				label = "Indent",
				order = 15,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			}
		})
	},
	Divider = {
		category = "Layout",
		defaults = {},
		fields = nativeFields(1, {
			axis = {
				type = "choice",
				label = "Axis",
				order = 7,
				options = { "x", "y" }
			},
			thickness = { type = "number", label = "Thickness", order = 8 },
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 9,
				options = { "standard", "strong" }
			}
		})
	},
	ErrorBoundary = {
		category = "Layout",
		container = true,
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = { width = "fill" },
		fields = nativeFields(2, {
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 8,
				format = "extent"
			},
			maxWidth = { type = "number", label = "Maximum width", order = 9 }
		})
	},
	Grid = {
		category = "Layout",
		container = true,
		defaults = { cellHeight = 72, columns = 2, gap = "s" },
		fields = nativeFields(4, {
			grow = { type = "number", label = "Grow", order = 40 },
			columns = { type = "number", label = "Columns", order = 1 },
			gap = {
				type = "choice",
				label = "Spacing",
				order = 2,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			cellHeight = { type = "number", label = "Cell height", order = 3 },
			width = {
				type = "value",
				label = "Width",
				order = 10,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 11,
				format = "extent"
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			padding = {
				type = "choice",
				label = "Padding",
				order = 13,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			rowGap = {
				type = "choice",
				label = "Row spacing",
				order = 14,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			aspectRatio = { type = "number", label = "Cell aspect ratio", order = 15 },
			flow = {
				type = "choice",
				label = "Flow",
				order = 16,
				options = { "row", "column" }
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 17,
				options = { "start", "center", "end" }
			}
		})
	},
	HStack = {
		category = "Layout",
		container = true,
		defaults = { gap = "s" },
		fields = nativeFields(6, {
			grow = { type = "number", label = "Grow", order = 40 },
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			gap = {
				type = "choice",
				label = "Spacing",
				order = 3,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 4,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end", "stretch" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			maxHeight = { type = "number", label = "Maximum height", order = 17 },
			distribute = {
				type = "choice",
				label = "Distribution",
				order = 13,
				options = {
					"start", "center", "end", "spaceBetween", "spaceAround", "spaceEvenly"
				}
			},
			wrap = { type = "boolean", label = "Wrap children", order = 14 }
		})
	},
	Image = {
		category = "Content",
		defaults = {
			height = 140,
			image = "rbxassetid://0",
			scaleMode = "crop",
			width = 240
		},
		fields = nativeFields(5, {
			image = { type = "string", label = "Asset URI", order = 1 },
			width = { type = "number", label = "Width", order = 2 },
			height = { type = "number", label = "Height", order = 3 },
			scaleMode = {
				type = "choice",
				label = "Framing",
				order = 4,
				options = {
					"fit", "fill", "crop", "stretch", "tile", "slice"
				}
			},
			tint = {
				type = "color",
				label = "Image tint",
				order = 11,
				format = "color"
			},
			resample = {
				type = "choice",
				label = "Sampling",
				order = 12,
				options = { "default", "pixelated" }
			},
			shape = {
				type = "choice",
				label = "Shape",
				order = 13,
				options = { "rect", "circle" }
			},
			tileSize = {
				type = "value",
				label = "Tile size",
				order = 14,
				format = "json"
			},
			sliceCenter = {
				type = "value",
				label = "Slice center",
				order = 15,
				format = "json"
			},
			sliceScale = { type = "number", label = "Slice scale", order = 16 },
			paintRect = {
				type = "value",
				label = "Painted rectangle",
				order = 17,
				format = "json"
			}
		})
	},
	Label = {
		category = "Content",
		defaults = { icon = "settings", title = "Explore" },
		fields = nativeFields(3, {
			title = { type = "string", label = "Title", order = 1 },
			icon = { type = "string", label = "Icon", order = 2 },
			presentation = {
				type = "choice",
				label = "Presentation",
				order = 9,
				options = { "titleAndIcon", "titleOnly", "iconOnly" }
			},
			iconSize = { type = "number", label = "Icon size", order = 10 },
			textSize = { type = "number", label = "Text size", order = 11 },
			gap = {
				type = "choice",
				label = "Spacing",
				order = 12,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			iconPosition = {
				type = "choice",
				label = "Icon position",
				order = 13,
				options = { "leading", "trailing" }
			}
		})
	},
	LevelPicker = {
		category = "Input",
		state = "value",
		defaults = {
			count = 5,
			segment = "bar",
			value = 3,
			glyphs = { empty = "☆", filled = "★" }
		},
		fields = nativeFields(7, {
			value = { type = "number", label = "Initial value", order = 1 },
			count = { type = "number", label = "Segments", order = 2 },
			segment = {
				type = "choice",
				label = "Segment",
				order = 3,
				options = { "bar", "glyph", "image" }
			},
			images = {
				type = "value",
				label = "Segment images",
				order = 4,
				format = "json"
			},
			glyphs = {
				type = "value",
				label = "Segment glyphs",
				order = 5,
				format = "json"
			},
			allowZero = { type = "boolean", label = "Allow zero", order = 6 },
			readOnly = { type = "boolean", label = "Read only", order = 13 },
			enabled = { type = "boolean", label = "Enabled", order = 14 },
			segmentSize = {
				type = "choice",
				label = "Segment size",
				order = 15,
				options = { "small", "medium", "large" }
			}
		})
	},
	Menu = {
		category = "Navigation",
		defaults = {
			label = "Actions",
			items = {
				{ id = "first", label = "Explore" },
				{ id = "second", label = "Save for later" }
			}
		},
		fields = nativeFields(6, {
			label = { type = "string", label = "Label", order = 1 },
			items = {
				type = "value",
				label = "Menu items",
				order = 2,
				format = "json"
			},
			presentation = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = { "automatic", "menu", "sheet" }
			},
			edge = {
				type = "choice",
				label = "Edge",
				order = 4,
				options = { "top", "bottom", "leading", "trailing" }
			},
			maxHeight = { type = "number", label = "Maximum height", order = 5 },
			disclosure = {
				type = "boolean",
				label = "Disclosure indicator",
				order = 12
			},
			enabled = { type = "boolean", label = "Enabled", order = 13 },
			backLabel = { type = "string", label = "Back label", order = 14 },
			align = {
				type = "choice",
				label = "Alignment",
				order = 15,
				options = { "start", "center", "end" }
			},
			width = { type = "number", label = "Menu width", order = 16 },
			triggers = {
				type = "value",
				label = "Open gestures",
				order = 17,
				format = "json"
			}
		})
	},
	NavBar = {
		category = "Navigation",
		defaults = { backLabel = "Back", surface = "pane", title = "Discover" },
		fields = nativeFields(7, {
			title = { type = "string", label = "Title", order = 1 },
			backLabel = { type = "string", label = "Back label", order = 2 },
			surface = {
				type = "choice",
				label = "Surface",
				order = 3,
				options = { "surface", "panel", "pane" }
			},
			gap = { type = "number", label = "Gap", order = 4 },
			padding = { type = "number", label = "Padding", order = 5 },
			trailing = { type = "content", label = "Trailing content", order = 6 }
		})
	},
	NavigationSplitView = {
		category = "Navigation",
		container = true,
		states = {
			"preferredCompactColumn",
			"sidebarWidth",
			"sidebarHeight"
		},
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			preferredCompactColumn = "sidebar",
			resizable = true,
			sidebarHeight = 240,
			sidebarWidth = 360
		},
		fields = nativeFields(9, {
			preferredCompactColumn = {
				type = "choice",
				label = "Compact column",
				order = 1,
				options = { "sidebar", "detail" }
			},
			axis = {
				type = "choice",
				label = "Split axis",
				order = 2,
				options = { "x", "y" }
			},
			resizable = { type = "boolean", label = "Resizable", order = 3 },
			alwaysShowResizeHandle = {
				type = "boolean",
				label = "Always show resize handle",
				order = 4
			},
			sidebarWidth = { type = "number", label = "Sidebar width", order = 5 },
			sidebarHeight = { type = "number", label = "Sidebar height", order = 6 },
			backLabel = { type = "string", label = "Back label", order = 7 },
			detailLabel = { type = "string", label = "Detail label", order = 8 }
		})
	},
	NavigationStack = {
		category = "Navigation",
		container = true,
		state = "path",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			destinations = { details = { title = "Details" } },
			path = {},
			root = { title = "Home" }
		},
		fields = nativeFields(5, {
			path = {
				type = "value",
				label = "Initial route",
				order = 1,
				format = "json"
			},
			root = {
				type = "value",
				label = "Root page",
				order = 2,
				format = "json"
			},
			destinations = {
				type = "value",
				label = "Destinations",
				order = 3,
				format = "json"
			},
			backLabel = { type = "string", label = "Back label", order = 4 }
		})
	},
	Notice = {
		category = "Status",
		defaults = {
			message = "Small details make a big difference.",
			severity = "success",
			title = "You’re all set"
		},
		fields = nativeFields(4, {
			title = { type = "string", label = "Title", order = 1 },
			message = { type = "string", label = "Message", order = 2 },
			severity = {
				type = "choice",
				label = "Severity",
				order = 3,
				options = { "info", "success", "warning", "error" }
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 10,
				options = { "standard", "emphasis" }
			},
			placement = {
				type = "choice",
				label = "Placement",
				order = 11,
				options = { "inline", "affixed" }
			},
			actions = {
				type = "value",
				label = "Actions",
				order = 12,
				format = "json"
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 13,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	NumberInput = {
		category = "Input",
		state = "numericValue",
		defaults = { max = 100, min = 0, numericValue = 3 },
		fields = nativeFields(5, {
			numericValue = { type = "number", label = "Initial value", order = 1 },
			min = { type = "number", label = "Minimum", order = 2 },
			max = { type = "number", label = "Maximum", order = 3 },
			step = { type = "number", label = "Step", order = 4 },
			enabled = { type = "boolean", label = "Enabled", order = 11 },
			readOnly = { type = "boolean", label = "Read only", order = 12 },
			hint = { type = "string", label = "Hint", order = 13 },
			errorText = { type = "string", label = "Error text", order = 14 },
			requiredMark = {
				type = "choice",
				label = "Requirement",
				order = 15,
				options = { "required", "optional" }
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 16,
				options = { "standard", "contrast", "utility" }
			},
			corners = {
				type = "choice",
				label = "Corners",
				order = 17,
				options = { "pill", "square" }
			},
			label = { type = "string", label = "Label", order = 18 },
			placeholder = { type = "string", label = "Placeholder", order = 19 },
			maxLength = { type = "number", label = "Maximum length", order = 21 },
			clearButton = { type = "boolean", label = "Clear button", order = 22 },
			clearButtonMode = {
				type = "choice",
				label = "Clear button mode",
				order = 23,
				options = { "never", "always", "whileEditing", "unlessEditing" }
			},
			selectOnFocus = {
				type = "choice",
				label = "Select on focus",
				order = 24,
				options = { "none", "all", "end" }
			},
			precision = { type = "number", label = "Precision", order = 25 },
			stepButtons = { type = "boolean", label = "Step buttons", order = 26 },
			prefix = { type = "string", label = "Prefix", order = 27 },
			suffix = { type = "string", label = "Suffix", order = 28 },
			scrub = { type = "boolean", label = "Scrub", order = 29 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 30,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Outline = {
		category = "Collections",
		container = true,
		nativeSize = true,
		defaults = {
			children = "children",
			gap = 6,
			itemSize = 44,
			key = "id",
			from = {
				{
					id = "one",
					label = "Folder",
					children = { { id = "child", label = "Child item" } }
				},
				{ id = "two", label = "Second item" },
				{ id = "three", label = "Third item" }
			},
			Size = { 0, 320, 0, 220 }
		},
		fields = nativeFields(13, {
			from = {
				type = "value",
				label = "Rows",
				order = 1,
				format = "json"
			},
			children = { type = "string", label = "Children field", order = 2 },
			indent = { type = "number", label = "Indentation", order = 3 },
			key = { type = "string", label = "Identity field", order = 4 },
			itemSize = { type = "number", label = "Row height", order = 5 },
			gap = { type = "number", label = "Gap", order = 6 },
			overscan = { type = "number", label = "Overscan", order = 7 },
			selectionMode = {
				type = "choice",
				label = "Selection mode",
				order = 8,
				options = { "none", "single", "multiple" }
			},
			reorderable = { type = "boolean", label = "Reorder rows", order = 9 },
			deletable = { type = "boolean", label = "Delete rows", order = 10 },
			editing = { type = "boolean", label = "Editing", order = 19 },
			measure = { type = "boolean", label = "Measure rows", order = 20 },
			reducedMotion = { type = "boolean", label = "Reduced motion", order = 21 },
			follow = {
				type = "choice",
				label = "Follow additions",
				order = 22,
				options = { "end", "none" }
			},
			followThreshold = { type = "number", label = "Follow threshold", order = 23 },
			snap = {
				type = "choice",
				label = "Snapping",
				order = 24,
				options = { "none", "item" }
			},
			autoscroll = { type = "boolean", label = "Drag scrolling", order = 25 },
			maxRetained = { type = "number", label = "Retained rows", order = 26 },
			focusPolicy = {
				type = "choice",
				label = "Focus policy",
				order = 27,
				options = { "key", "index" }
			},
			autoFocus = { type = "boolean", label = "Initial focus", order = 28 },
			wrapFocus = { type = "boolean", label = "Wrap focus", order = 29 },
			initialFocus = { type = "string", label = "Initial focus key", order = 30 }
		})
	},
	PageView = {
		category = "Navigation",
		container = true,
		state = "selection",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			controls = true,
			indicators = true,
			selection = "first",
			pages = {
				{ id = "first", label = "Discover" },
				{ id = "second", label = "Favorites" }
			}
		},
		fields = nativeFields(6, {
			selection = { type = "string", label = "Initial page", order = 1 },
			pages = {
				type = "value",
				label = "Pages",
				order = 2,
				format = "json"
			},
			indicators = { type = "boolean", label = "Indicators", order = 3 },
			controls = {
				type = "boolean",
				label = "Navigation controls",
				order = 4
			},
			summary = { type = "boolean", label = "Summary", order = 5 }
		})
	},
	Pagination = {
		category = "Navigation",
		container = true,
		state = "page",
		seeds = {},
		defaults = { form = "numbers", page = 1, pageCount = 8 },
		fields = nativeFields(7, {
			page = { type = "number", label = "Initial page", order = 1 },
			pageCount = { type = "number", label = "Page count", order = 2 },
			form = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = { "numbers", "arrows", "label" }
			},
			siblingCount = { type = "number", label = "Sibling count", order = 4 },
			boundaryCount = { type = "number", label = "Boundary count", order = 5 },
			showFirstLast = { type = "boolean", label = "First and last", order = 6 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 13,
				options = { "xsmall", "compact", "regular", "large" }
			},
			enabled = { type = "boolean", label = "Enabled", order = 14 }
		})
	},
	Path = {
		category = "Content",
		defaults = {
			height = 100,
			thickness = 2,
			width = 240,
			points = {
				{
					inX = 0,
					inY = 1,
					outX = 0,
					outY = 1,
					x = 0,
					y = 1
				},
				{
					inX = 1,
					inY = 0,
					outX = 1,
					outY = 0,
					x = 1,
					y = 0
				}
			}
		},
		fields = nativeFields(7, {
			points = {
				type = "value",
				label = "Bezier points",
				order = 1,
				format = "json",
				tokens = true
			},
			width = { type = "number", label = "Width", order = 2 },
			height = { type = "number", label = "Height", order = 3 },
			thickness = { type = "number", label = "Thickness", order = 4 },
			closed = { type = "boolean", label = "Closed path", order = 5 },
			role = {
				type = "choice",
				label = "Color role",
				order = 6,
				options = { "content", "secondary", "accent" }
			},
			tint = {
				type = "color",
				label = "Path color",
				order = 13,
				format = "color"
			}
		})
	},
	Picker = {
		category = "Navigation",
		state = "selected",
		defaults = {
			selected = "first",
			style = "segmented",
			options = {
				{
					label = "First option",
					value = "first",
					icon = "speaker"
				},
				{
					label = "Second option",
					value = "second",
					icon = "volume"
				}
			}
		},
		fields = nativeFields(8, {
			onChange = { type = "event", label = "Changed", order = 25 },
			selected = { type = "string", label = "Initial selection", order = 1 },
			options = {
				type = "value",
				label = "Options",
				order = 2,
				format = "json"
			},
			style = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = {
					"automatic", "menu", "navigationLink", "segmented", "inline", "radioGroup",
					"cards"
				}
			},
			label = { type = "string", label = "Label", order = 4 },
			placeholder = { type = "string", label = "Placeholder", order = 5 },
			axis = {
				type = "choice",
				label = "Axis",
				order = 6,
				options = { "x", "y" }
			},
			sizing = {
				type = "choice",
				label = "Sizing",
				order = 7,
				options = { "fill", "hug" }
			},
			required = { type = "boolean", label = "Required", order = 14 },
			enabled = { type = "boolean", label = "Enabled", order = 15 },
			iconOnly = { type = "boolean", label = "Icons only", order = 16 },
			textSize = { type = "number", label = "Text size", order = 17 },
			maxHeight = { type = "number", label = "Maximum height", order = 18 },
			indicator = {
				type = "choice",
				label = "Indicator",
				order = 19,
				options = { "automatic", "pill", "underline", "none" }
			},
			indicatorPosition = {
				type = "choice",
				label = "Indicator position",
				order = 20,
				options = { "leading", "trailing" }
			},
			valueAlignment = {
				type = "choice",
				label = "Value alignment",
				order = 21,
				options = { "start", "end" }
			},
			hint = { type = "string", label = "Hint", order = 22 },
			errorText = { type = "string", label = "Error text", order = 23 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 24,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Popover = {
		category = "Overlays",
		container = true,
		content = "content",
		state = "isPresented",
		anchor = "trigger",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			anchorLabel = "Show details",
			edge = "bottom",
			isPresented = false,
			tail = true,
			title = "Details"
		},
		fields = nativeFields(9, {
			isPresented = { type = "boolean", label = "Presented", order = 1 },
			title = { type = "string", label = "Title", order = 2 },
			anchorLabel = { type = "string", label = "Trigger label", order = 3 },
			edge = {
				type = "choice",
				label = "Edge",
				order = 4,
				options = { "top", "bottom", "leading", "trailing" }
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end" }
			},
			tail = { type = "boolean", label = "Tail", order = 6 },
			gap = { type = "number", label = "Gap", order = 7 },
			compact = {
				type = "choice",
				label = "Compact form",
				order = 8,
				options = { "sheet", "popover" }
			},
			crossOffset = { type = "number", label = "Cross offset", order = 15 },
			maxWidth = { type = "number", label = "Maximum width", order = 16 },
			maxHeight = { type = "number", label = "Maximum height", order = 17 },
			modal = { type = "boolean", label = "Modal", order = 18 },
			cancelPolicy = {
				type = "choice",
				label = "Cancel policy",
				order = 19,
				options = { "dismiss", "none" }
			}
		})
	},
	ProgressView = {
		category = "Status",
		defaults = {
			label = "Getting ready",
			presentation = "bar",
			value = 0.65
		},
		fields = nativeFields(4, {
			value = { type = "number", label = "Progress", order = 1 },
			label = { type = "string", label = "Label", order = 2 },
			presentation = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = { "bar", "circular", "gauge", "spinner" }
			},
			min = { type = "number", label = "Minimum", order = 10 },
			max = { type = "number", label = "Maximum", order = 11 },
			endLabel = { type = "string", label = "End label", order = 12 },
			showValue = { type = "boolean", label = "Show value", order = 13 },
			diameter = { type = "number", label = "Diameter", order = 14 },
			thickness = { type = "number", label = "Thickness", order = 15 },
			segments = { type = "number", label = "Segments", order = 16 },
			trail = {
				type = "value",
				label = "Progress trail",
				order = 17,
				format = "json"
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 18,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	RadialMenu = {
		category = "Navigation",
		state = "isPresented",
		defaults = {
			appearance = "wedges",
			isPresented = false,
			label = "Actions",
			preset = "donut",
			items = {
				{ id = "first", label = "Explore" },
				{ id = "second", label = "Save for later" }
			}
		},
		fields = nativeFields(8, {
			label = { type = "string", label = "Label", order = 1 },
			items = {
				type = "value",
				label = "Radial items",
				order = 2,
				format = "json"
			},
			preset = {
				type = "choice",
				label = "Preset",
				order = 3,
				options = {
					"donut",
					"top-left",
					"top-right",
					"bottom-left",
					"bottom-right"
				}
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 4,
				options = { "wedges", "buttons" }
			},
			distribution = {
				type = "choice",
				label = "Distribution",
				order = 5,
				options = { "even", "compass" }
			},
			isPresented = { type = "boolean", label = "Presented", order = 6 },
			scrim = {
				type = "choice",
				label = "Scrim",
				order = 7,
				options = { "dark", "light", "none" }
			},
			skin = {
				type = "value",
				label = "Skin",
				order = 14,
				format = "json",
				tokens = true
			}
		})
	},
	Rating = {
		category = "Input",
		state = "value",
		defaults = { count = 5, value = 4 },
		fields = nativeFields(3, {
			value = { type = "number", label = "Initial value", order = 1 },
			count = { type = "number", label = "Stars", order = 2 },
			readOnly = { type = "boolean", label = "Read only", order = 9 },
			enabled = { type = "boolean", label = "Enabled", order = 10 },
			allowZero = { type = "boolean", label = "Allow zero", order = 11 },
			glyphs = {
				type = "value",
				label = "Star glyphs",
				order = 12,
				format = "json"
			},
			starSize = {
				type = "choice",
				label = "Star size",
				order = 13,
				options = { "small", "medium", "large" }
			}
		})
	},
	Region = {
		category = "Layout",
		container = true,
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = { rank = 1, zone = "center" },
		fields = nativeFields(5, {
			zone = {
				type = "choice",
				label = "Zone",
				order = 1,
				options = {
					"topLeft", "top", "topRight", "left", "center", "right", "bottomLeft",
					"bottom", "bottomRight", "topbar"
				}
			},
			rank = { type = "number", label = "Priority", order = 2 },
			mayDrop = { type = "boolean", label = "May drop", order = 3 },
			reveal = { type = "boolean", label = "Reveal", order = 4 }
		})
	},
	RowActions = {
		category = "Collections",
		container = true,
		content = "content",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			trailing = {
				{ id = "archive", label = "Archive" },
				{ id = "delete", label = "Delete", role = "destructive" }
			}
		},
		fields = nativeFields(6, {
			leading = {
				type = "value",
				label = "Leading actions",
				order = 1,
				format = "json"
			},
			trailing = {
				type = "value",
				label = "Trailing actions",
				order = 2,
				format = "json"
			},
			actionWidth = { type = "number", label = "Action width", order = 3 },
			fullSwipe = { type = "boolean", label = "Full swipe", order = 4 },
			editing = { type = "boolean", label = "Editing", order = 5 },
			enabled = { type = "boolean", label = "Enabled", order = 12 },
			reducedMotion = { type = "boolean", label = "Reduced motion", order = 13 }
		})
	},
	Screen = {
		category = "Layout",
		container = true,
		defaults = { gap = "m" },
		fields = nativeFields(6, {
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			gap = {
				type = "choice",
				label = "Spacing",
				order = 3,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 4,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end", "stretch" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			distribute = {
				type = "choice",
				label = "Distribution",
				order = 13,
				options = {
					"start", "center", "end", "spaceBetween", "spaceAround", "spaceEvenly"
				}
			}
		})
	},
	ScrollView = {
		category = "Layout",
		container = true,
		defaults = { gap = "s", height = 240, width = "fill" },
		fields = nativeFields(6, {
			grow = { type = "number", label = "Grow", order = 40 },
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			gap = {
				type = "choice",
				label = "Spacing",
				order = 3,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 4,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end", "stretch" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			maxHeight = { type = "number", label = "Maximum height", order = 16 },
			distribute = {
				type = "choice",
				label = "Distribution",
				order = 13,
				options = {
					"start", "center", "end", "spaceBetween", "spaceAround", "spaceEvenly"
				}
			},
			axis = {
				type = "choice",
				label = "Scroll axis",
				order = 14,
				options = { "x", "y", "xy" }
			},
			ScrollBarThickness = { type = "number", label = "Scroll bar width", order = 15 }
		})
	},
	Sheet = {
		category = "Overlays",
		container = true,
		content = "content",
		states = { "isPresented", "detent" },
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			detent = "medium",
			isPresented = true,
			title = "A little more detail"
		},
		fields = nativeFields(8, {
			isPresented = { type = "boolean", label = "Presented", order = 1 },
			title = { type = "string", label = "Title", order = 2 },
			detent = {
				type = "choice",
				label = "Initial detent",
				order = 3,
				options = { "medium", "large", "hug" }
			},
			detents = {
				type = "value",
				label = "Available detents",
				order = 4,
				format = "json"
			},
			placement = {
				type = "choice",
				label = "Placement",
				order = 5,
				options = {
					"automatic",
					"adaptive",
					"bottom",
					"side",
					"center"
				}
			},
			interactiveDismissDisabled = { type = "boolean", label = "Disable dismissal", order = 6 },
			dragIndicator = {
				type = "choice",
				label = "Drag indicator",
				order = 7,
				options = { "automatic", "visible", "hidden" }
			},
			edge = {
				type = "choice",
				label = "Side edge",
				order = 14,
				options = { "left", "right" }
			},
			width = {
				type = "choice",
				label = "Width",
				order = 15,
				options = { "automatic", "narrow", "wide" }
			},
			closeButton = { type = "boolean", label = "Close button", order = 16 },
			actionLayout = {
				type = "choice",
				label = "Action layout",
				order = 17,
				options = { "automatic", "row", "stacked" }
			},
			contentInset = {
				type = "choice",
				label = "Content inset",
				order = 18,
				options = { "standard", "none" }
			},
			scrollPolicy = {
				type = "choice",
				label = "Scrolling",
				order = 19,
				options = { "always", "atLargestDetent" }
			},
			hero = {
				type = "value",
				label = "Hero image",
				order = 20,
				format = "json"
			},
			actions = {
				type = "value",
				label = "Actions",
				order = 21,
				format = "json"
			},
			initialFocus = {
				type = "string",
				label = "Initial focus name",
				order = 22
			}
		})
	},
	ShortcutHint = {
		category = "Input",
		defaults = { label = "Save", keys = { { "Ctrl", "S" } } },
		fields = nativeFields(4, {
			keys = {
				type = "value",
				label = "Key combinations",
				order = 1,
				format = "json"
			},
			label = { type = "string", label = "Label", order = 2 },
			labelPosition = {
				type = "choice",
				label = "Label position",
				order = 3,
				options = { "start", "end" }
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 10,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Skeleton = {
		category = "Content",
		defaults = { form = "line", lines = 3 },
		fields = nativeFields(4, {
			form = {
				type = "choice",
				label = "Form",
				order = 1,
				options = { "box", "circle", "line" }
			},
			lines = { type = "number", label = "Lines", order = 2 },
			controlSize = {
				type = "choice",
				label = "Size",
				order = 3,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Slider = {
		category = "Input",
		state = "value",
		defaults = { max = 1, min = 0, value = 0.65 },
		fields = nativeFields(5, {
			value = { type = "number", label = "Initial value", order = 1 },
			min = { type = "number", label = "Minimum", order = 2 },
			max = { type = "number", label = "Maximum", order = 3 },
			step = { type = "number", label = "Step", order = 4 },
			enabled = { type = "boolean", label = "Enabled", order = 11 },
			label = { type = "string", label = "Label", order = 12 },
			tapToPosition = { type = "boolean", label = "Tap to set", order = 13 },
			axis = {
				type = "choice",
				label = "Axis",
				order = 14,
				options = { "x", "y" }
			},
			thumb = {
				type = "choice",
				label = "Thumb",
				order = 15,
				options = { "always", "auto", "none" }
			},
			contained = { type = "boolean", label = "Contained", order = 16 },
			rotation = { type = "number", label = "Rotation", order = 17 },
			thumbImage = { type = "string", label = "Thumb image", order = 18 },
			trackImage = { type = "string", label = "Track image", order = 19 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 20,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Spacer = {
		category = "Layout",
		defaults = { minLength = 16 },
		fields = nativeFields(2, {
			minLength = { type = "number", label = "Minimum length", order = 1 }
		})
	},
	SplitButton = {
		category = "Navigation",
		defaults = {
			label = "Continue",
			items = {
				{ id = "first", label = "Explore" },
				{ id = "second", label = "Save for later" }
			}
		},
		fields = nativeFields(6, {
			label = { type = "string", label = "Label", order = 1 },
			items = {
				type = "value",
				label = "Menu items",
				order = 2,
				format = "json"
			},
			menuLabel = { type = "string", label = "Menu label", order = 3 },
			enabled = { type = "boolean", label = "Enabled", order = 4 },
			busy = { type = "boolean", label = "Busy", order = 5 }
		})
	},
	Stage = {
		category = "Content",
		nativeSize = true,
		defaults = { fieldOfView = 45, height = 180, width = 240 },
		fields = nativeFields(5, {
			fieldOfView = { type = "number", label = "Field of view", order = 1 },
			width = { type = "number", label = "Width", order = 2 },
			height = { type = "number", label = "Height", order = 3 },
			lazy = { type = "boolean", label = "Lazy rendering", order = 4 }
		})
	},
	StatusIndicator = {
		category = "Status",
		defaults = { name = "Online", status = "success" },
		fields = nativeFields(4, {
			name = { type = "string", label = "Label", order = 1 },
			status = {
				type = "choice",
				label = "Status",
				order = 2,
				options = {
					"neutral", "info", "success", "warning", "error", "accent"
				}
			},
			form = {
				type = "choice",
				label = "Shape",
				order = 3,
				options = { "dot", "ring", "square", "dash" }
			},
			count = { type = "number", label = "Count", order = 10 },
			max = { type = "number", label = "Maximum", order = 11 },
			diameter = { type = "number", label = "Diameter", order = 12 },
			cutout = { type = "boolean", label = "Cutout", order = 13 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 14,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	StepIndicator = {
		category = "Navigation",
		state = "current",
		defaults = {
			current = "first",
			steps = {
				{ id = "first", label = "Choose" },
				{ id = "second", label = "Review" },
				{ id = "third", label = "Finish" }
			}
		},
		fields = nativeFields(5, {
			current = { type = "string", label = "Current step", order = 1 },
			steps = {
				type = "value",
				label = "Steps",
				order = 2,
				format = "json"
			},
			sizing = {
				type = "choice",
				label = "Sizing",
				order = 3,
				options = { "fill", "hug" }
			},
			listLabel = { type = "string", label = "Accessible label", order = 4 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 11,
				options = { "xsmall", "compact", "regular", "large" }
			},
			enabled = { type = "boolean", label = "Enabled", order = 12 }
		})
	},
	Stepper = {
		category = "Input",
		state = "value",
		defaults = { max = 10, min = 0, value = 3 },
		fields = nativeFields(5, {
			value = { type = "number", label = "Initial value", order = 1 },
			min = { type = "number", label = "Minimum", order = 2 },
			max = { type = "number", label = "Maximum", order = 3 },
			step = { type = "number", label = "Step", order = 4 },
			enabled = { type = "boolean", label = "Enabled", order = 11 },
			label = { type = "string", label = "Label", order = 12 },
			repeatDelay = { type = "number", label = "Repeat delay", order = 13 },
			repeatInterval = { type = "number", label = "Repeat interval", order = 14 }
		})
	},
	TabView = {
		category = "Navigation",
		container = true,
		state = "selection",
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = {
			placement = "topBar",
			selection = "first",
			tabs = {
				{ id = "first", label = "Discover" },
				{ id = "second", label = "Favorites" }
			}
		},
		fields = nativeFields(8, {
			selection = { type = "string", label = "Initial tab", order = 1 },
			tabs = {
				type = "value",
				label = "Tabs",
				order = 2,
				format = "json"
			},
			placement = {
				type = "choice",
				label = "Placement",
				order = 3,
				options = {
					"automatic", "topBar", "sidebar", "bottomBar", "bottomBarCompact", "none"
				}
			},
			style = {
				type = "choice",
				label = "Style",
				order = 4,
				options = { "automatic", "sidebarAdaptable", "collapsible" }
			},
			retention = {
				type = "choice",
				label = "Retention",
				order = 5,
				options = { "all", "top" }
			},
			restoreScroll = { type = "boolean", label = "Restore scroll", order = 6 },
			restoreFocus = { type = "boolean", label = "Restore focus", order = 7 },
			railWidth = { type = "number", label = "Sidebar width", order = 14 },
			sidebarPreference = {
				type = "choice",
				label = "Sidebar preference",
				order = 15,
				options = { "automatic", "topBar", "sidebar" }
			},
			shoulderNavigation = {
				type = "choice",
				label = "Shoulder navigation",
				order = 16,
				options = { "strip", "content" }
			},
			indicator = {
				type = "choice",
				label = "Indicator",
				order = 17,
				options = { "automatic", "pill", "underline", "none" }
			},
			iconOnly = { type = "boolean", label = "Icons only", order = 18 },
			textSize = { type = "number", label = "Text size", order = 19 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 20,
				options = { "xsmall", "compact", "regular", "large" }
			},
			enabled = { type = "boolean", label = "Enabled", order = 21 },
			sections = {
				type = "value",
				label = "Sections",
				order = 22,
				format = "json"
			},
			customization = {
				type = "value",
				label = "Tab customization",
				order = 23,
				format = "json"
			}
		})
	},
	Table = {
		category = "Collections",
		container = true,
		nativeSize = true,
		defaults = {
			itemSize = 44,
			key = "id",
			columns = {
				{ id = "label", label = "Player", width = 160 },
				{ id = "score", label = "Score", width = 100 }
			},
			from = {
				{ id = "one", label = "First item", score = 120 },
				{ id = "two", label = "Second item", score = 95 }
			},
			Size = { 0, 320, 0, 240 }
		},
		fields = nativeFields(10, {
			from = {
				type = "value",
				label = "Rows",
				order = 1,
				format = "json"
			},
			columns = {
				type = "value",
				label = "Columns",
				order = 2,
				format = "json"
			},
			key = { type = "string", label = "Identity field", order = 3 },
			itemSize = { type = "number", label = "Row height", order = 4 },
			headerHeight = { type = "number", label = "Header height", order = 5 },
			header = { type = "boolean", label = "Show header", order = 6 },
			alternatingRows = { type = "boolean", label = "Alternating rows", order = 7 },
			overscan = { type = "number", label = "Overscan", order = 16 },
			gap = { type = "number", label = "Spacing", order = 17 },
			editing = { type = "boolean", label = "Editing", order = 18 },
			measure = { type = "boolean", label = "Measure rows", order = 19 },
			reducedMotion = { type = "boolean", label = "Reduced motion", order = 20 },
			follow = {
				type = "choice",
				label = "Follow additions",
				order = 21,
				options = { "end", "none" }
			},
			followThreshold = { type = "number", label = "Follow threshold", order = 22 },
			snap = {
				type = "choice",
				label = "Snapping",
				order = 23,
				options = { "none", "item" }
			},
			reorderable = { type = "boolean", label = "Reorder rows", order = 24 },
			deletable = { type = "boolean", label = "Delete rows", order = 25 },
			scrolls = { type = "boolean", label = "Scrollable", order = 26 },
			selectionMode = {
				type = "choice",
				label = "Selection mode",
				order = 27,
				options = { "none", "single", "multiple" }
			},
			rowActions = {
				type = "value",
				label = "Row actions",
				order = 30,
				format = "json",
				perRow = true
			}
		})
	},
	Text = {
		category = "Content",
		container = true,
		seeds = {},
		defaults = {
			text = "A little possibility",
			textRole = "body",
			wrap = true
		},
		fields = nativeFields(6, {
			text = { type = "string", label = "Text", order = 1 },
			textRole = {
				type = "choice",
				label = "Typography",
				order = 2,
				options = {
					"body", "title", "heading", "caption", "label", "strong", "control", "numeral"
				}
			},
			role = {
				type = "choice",
				label = "Color role",
				order = 3,
				options = { "content", "secondary" }
			},
			wrap = { type = "boolean", label = "Wrap text", order = 4 },
			textAlign = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end" }
			},
			truncate = {
				type = "choice",
				label = "Truncation",
				order = 12,
				options = { "end", "middle" }
			},
			textSize = { type = "number", label = "Text size", order = 13 },
			lines = { type = "number", label = "Maximum lines", order = 14 },
			rich = { type = "boolean", label = "Rich text", order = 15 },
			direction = {
				type = "choice",
				label = "Text direction",
				order = 16,
				options = { "auto", "ltr", "rtl" }
			},
			tint = {
				type = "color",
				label = "Text color",
				order = 17,
				format = "color"
			}
		})
	},
	TextInput = {
		category = "Input",
		state = "value",
		defaults = { placeholder = "Your name", value = "" },
		fields = nativeFields(7, {
			onChange = { type = "event", label = "Text changed", order = 25 },
			Focused = { type = "event", label = "Focused", order = 26 },
			value = { type = "string", label = "Initial text", order = 1 },
			placeholder = { type = "string", label = "Placeholder", order = 2 },
			label = { type = "string", label = "Field label", order = 3 },
			hint = { type = "string", label = "Hint", order = 4 },
			multiline = { type = "boolean", label = "Multiline", order = 5 },
			clearButton = { type = "boolean", label = "Clear button", order = 6 },
			enabled = { type = "boolean", label = "Enabled", order = 13 },
			readOnly = { type = "boolean", label = "Read only", order = 14 },
			errorText = { type = "string", label = "Error text", order = 15 },
			requiredMark = {
				type = "choice",
				label = "Requirement",
				order = 16,
				options = { "required", "optional" }
			},
			appearance = {
				type = "choice",
				label = "Appearance",
				order = 17,
				options = { "standard", "contrast", "utility" }
			},
			corners = {
				type = "choice",
				label = "Corners",
				order = 18,
				options = { "pill", "square" }
			},
			visibleLines = { type = "number", label = "Visible lines", order = 19 },
			maxLength = { type = "number", label = "Maximum length", order = 20 },
			clearButtonMode = {
				type = "choice",
				label = "Clear button mode",
				order = 21,
				options = { "never", "always", "whileEditing", "unlessEditing" }
			},
			selectOnFocus = {
				type = "choice",
				label = "Select on focus",
				order = 22,
				options = { "none", "all", "end" }
			},
			presentation = {
				type = "choice",
				label = "Presentation",
				order = 23,
				options = { "plain", "search" }
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 24,
				options = { "xsmall", "compact", "regular", "large" }
			},
			trailing = { type = "content", label = "Trailing content", order = 27 }
		})
	},
	Toast = {
		category = "Overlays",
		state = "isPresented",
		defaults = {
			closeButton = true,
			duration = 0,
			isPresented = true,
			message = "Saved. You’re all set.",
			action = { label = "Done" }
		},
		fields = nativeFields(9, {
			message = { type = "string", label = "Message", order = 1 },
			action = {
				type = "value",
				label = "Action",
				order = 2,
				format = "json"
			},
			isPresented = { type = "boolean", label = "Presented", order = 3 },
			duration = { type = "number", label = "Duration", order = 4 },
			closeButton = { type = "boolean", label = "Close button", order = 5 },
			position = {
				type = "choice",
				label = "Position without action",
				order = 6,
				options = { "top", "bottom" }
			},
			width = {
				type = "choice",
				label = "Width without action",
				order = 7,
				options = { "fill", "hug" }
			},
			fade = { type = "boolean", label = "Fade", order = 8 },
			icon = { type = "string", label = "Icon", order = 15 },
			key = { type = "string", label = "Identity", order = 16 },
			priority = { type = "number", label = "Priority", order = 17 },
			readFloor = { type = "number", label = "Reading time", order = 18 }
		})
	},
	Toggle = {
		category = "Input",
		state = "value",
		defaults = { label = "Notifications", value = true },
		fields = nativeFields(4, {
			onChange = { type = "event", label = "Change requested", order = 28 },
			label = { type = "string", label = "Label", order = 1 },
			value = { type = "boolean", label = "Initial value", order = 2 },
			presentation = {
				type = "choice",
				label = "Presentation",
				order = 3,
				options = { "switch", "checkbox", "button" }
			},
			subtitle = { type = "string", label = "Subtitle", order = 10 },
			hint = { type = "string", label = "Hint", order = 11 },
			trailingIcon = { type = "string", label = "Trailing icon", order = 12 },
			image = { type = "string", label = "Image URI", order = 13 },
			imageAspectRatio = { type = "number", label = "Image ratio", order = 14 },
			imageFraming = {
				type = "choice",
				label = "Image framing",
				order = 15,
				options = { "fit", "crop" }
			},
			compactLabel = { type = "string", label = "Compact label", order = 16 },
			busy = { type = "boolean", label = "Busy", order = 17 },
			enabled = { type = "boolean", label = "Enabled", order = 18 },
			shape = {
				type = "choice",
				label = "Shape",
				order = 19,
				options = { "rect", "circle" }
			},
			role = {
				type = "choice",
				label = "Role",
				order = 20,
				options = { "default", "cancel", "destructive", "onIndicator" }
			},
			disclose = {
				type = "boolean",
				label = "Disclosure indicator",
				order = 21
			},
			textSize = { type = "number", label = "Text size", order = 22 },
			help = { type = "string", label = "Help", order = 23 },
			row = {
				type = "value",
				label = "Row content",
				order = 24,
				format = "json"
			},
			mixed = { type = "boolean", label = "Mixed value", order = 25 },
			indicatorPosition = {
				type = "choice",
				label = "Indicator position",
				order = 26,
				options = { "leading", "trailing" }
			},
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 27,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	VStack = {
		category = "Layout",
		container = true,
		defaults = { gap = "s", width = "fill" },
		fields = nativeFields(6, {
			grow = { type = "number", label = "Grow", order = 40 },
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			gap = {
				type = "choice",
				label = "Spacing",
				order = 3,
				format = "spacing",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 4,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			align = {
				type = "choice",
				label = "Alignment",
				order = 5,
				options = { "start", "center", "end", "stretch" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			maxHeight = { type = "number", label = "Maximum height", order = 17 },
			distribute = {
				type = "choice",
				label = "Distribution",
				order = 13,
				options = {
					"start", "center", "end", "spaceBetween", "spaceAround", "spaceEvenly"
				}
			},
			wrap = { type = "boolean", label = "Wrap children", order = 14 }
		})
	},
	ViewThatFits = {
		category = "Layout",
		container = true,
		seeds = {
			{
				kind = "Text",
				props = { text = "Make this content yours", wrap = true },
				children = {}
			}
		},
		defaults = { height = 80, width = "fill" },
		fields = nativeFields(3, {
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			maxWidth = { type = "number", label = "Maximum width", order = 9 }
		})
	},
	VirtualGrid = {
		category = "Collections",
		container = true,
		nativeSize = true,
		defaults = {
			columns = 2,
			gap = 6,
			itemSize = 80,
			key = "id",
			from = {
				{ id = "one", label = "First item" },
				{ id = "two", label = "Second item" },
				{ id = "three", label = "Third item" }
			},
			Size = { 0, 320, 0, 220 }
		},
		fields = nativeFields(10, {
			from = {
				type = "value",
				label = "Items",
				order = 1,
				format = "json"
			},
			key = { type = "string", label = "Identity field", order = 2 },
			itemSize = { type = "number", label = "Cell height", order = 3 },
			columns = { type = "number", label = "Columns", order = 4 },
			gap = { type = "number", label = "Gap", order = 5 },
			crossGap = { type = "number", label = "Column gap", order = 6 },
			selectionMode = {
				type = "choice",
				label = "Selection mode",
				order = 7,
				options = { "none", "single", "multiple" }
			},
			overscan = { type = "number", label = "Overscan", order = 16 },
			editing = { type = "boolean", label = "Editing", order = 17 },
			measure = { type = "boolean", label = "Measure rows", order = 18 },
			reducedMotion = { type = "boolean", label = "Reduced motion", order = 19 },
			follow = {
				type = "choice",
				label = "Follow additions",
				order = 20,
				options = { "end", "none" }
			},
			followThreshold = { type = "number", label = "Follow threshold", order = 21 },
			snap = {
				type = "choice",
				label = "Snapping",
				order = 22,
				options = { "none", "item" }
			},
			reorderable = { type = "boolean", label = "Reorder rows", order = 23 },
			deletable = { type = "boolean", label = "Delete rows", order = 24 },
			autoscroll = { type = "boolean", label = "Drag scrolling", order = 25 },
			maxRetained = { type = "number", label = "Retained rows", order = 26 },
			focusPolicy = {
				type = "choice",
				label = "Focus policy",
				order = 27,
				options = { "key", "index" }
			},
			autoFocus = { type = "boolean", label = "Initial focus", order = 28 },
			wrapFocus = { type = "boolean", label = "Wrap focus", order = 29 },
			initialFocus = { type = "string", label = "Initial focus key", order = 30 }
		})
	},
	VirtualList = {
		category = "Collections",
		container = true,
		nativeSize = true,
		defaults = {
			gap = 6,
			itemSize = 44,
			key = "id",
			from = {
				{ id = "one", label = "First item" },
				{ id = "two", label = "Second item" },
				{ id = "three", label = "Third item" }
			},
			Size = { 0, 320, 0, 220 }
		},
		fields = nativeFields(11, {
			from = {
				type = "value",
				label = "Rows",
				order = 1,
				format = "json"
			},
			key = { type = "string", label = "Identity field", order = 2 },
			itemSize = { type = "number", label = "Row height", order = 3 },
			gap = { type = "number", label = "Gap", order = 4 },
			overscan = { type = "number", label = "Overscan", order = 5 },
			selectionMode = {
				type = "choice",
				label = "Selection mode",
				order = 6,
				options = { "none", "single", "multiple" }
			},
			reorderable = { type = "boolean", label = "Reorder rows", order = 7 },
			deletable = { type = "boolean", label = "Delete rows", order = 8 },
			editing = { type = "boolean", label = "Editing", order = 17 },
			measure = { type = "boolean", label = "Measure rows", order = 18 },
			reducedMotion = { type = "boolean", label = "Reduced motion", order = 19 },
			follow = {
				type = "choice",
				label = "Follow additions",
				order = 20,
				options = { "end", "none" }
			},
			followThreshold = { type = "number", label = "Follow threshold", order = 21 },
			snap = {
				type = "choice",
				label = "Snapping",
				order = 22,
				options = { "none", "item" }
			},
			autoscroll = { type = "boolean", label = "Drag scrolling", order = 23 },
			maxRetained = { type = "number", label = "Retained rows", order = 24 },
			focusPolicy = {
				type = "choice",
				label = "Focus policy",
				order = 25,
				options = { "key", "index" }
			},
			autoFocus = { type = "boolean", label = "Initial focus", order = 26 },
			wrapFocus = { type = "boolean", label = "Wrap focus", order = 27 },
			initialFocus = { type = "string", label = "Initial focus key", order = 28 }
		})
	},
	Vote = {
		category = "Input",
		state = "value",
		defaults = { summary = "Was this helpful?", value = "none" },
		fields = nativeFields(4, {
			value = {
				type = "choice",
				label = "Initial vote",
				order = 1,
				options = { "up", "down", "none" }
			},
			summary = { type = "string", label = "Summary", order = 2 },
			readOnly = { type = "boolean", label = "Read only", order = 3 },
			controlSize = {
				type = "choice",
				label = "Control size",
				order = 10,
				options = { "xsmall", "compact", "regular", "large" }
			}
		})
	},
	Group = {
		category = "Layout",
		container = true,
		defaults = { height = 160, width = "fill", groupTransparency = 0 },
		fields = {
			grow = { type = "number", label = "Grow", order = 40 },
			groupTransparency = { type = "number", label = "Group transparency", order = 1 },
			width = {
				type = "value",
				label = "Width",
				order = 2,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 3,
				format = "extent"
			},
			padding = {
				type = "value",
				label = "Padding",
				order = 4,
				format = "padding"
			},
			maxWidth = { type = "number", label = "Maximum width", order = 5 },
			corners = {
				type = "choice",
				label = "Corners",
				order = 6,
				options = { "pill", "square", "control", "panel" }
			}
		}
	},
	ZStack = {
		category = "Layout",
		container = true,
		defaults = { height = 160, width = "fill" },
		fields = nativeFields(6, {
			grow = { type = "number", label = "Grow", order = 40 },
			width = {
				type = "value",
				label = "Width",
				order = 1,
				format = "extent"
			},
			height = {
				type = "value",
				label = "Height",
				order = 2,
				format = "extent"
			},
			padding = {
				type = "choice",
				label = "Padding",
				order = 3,
				format = "padding",
				options = {
					"xs",
					"s",
					"m",
					"l",
					"xl"
				}
			},
			alignH = {
				type = "choice",
				label = "Horizontal",
				order = 4,
				options = { "start", "center", "end" }
			},
			alignV = {
				type = "choice",
				label = "Vertical",
				order = 5,
				options = { "start", "center", "end" }
			},
			maxWidth = { type = "number", label = "Maximum width", order = 12 },
			maxHeight = { type = "number", label = "Maximum height", order = 13 },
			corners = {
				type = "choice",
				label = "Corners",
				order = 14,
				options = { "pill", "square", "control", "panel" }
			}
		})
	}
}