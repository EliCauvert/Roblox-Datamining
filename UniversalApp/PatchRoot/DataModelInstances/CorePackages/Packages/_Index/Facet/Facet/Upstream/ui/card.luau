local _ = require("./types")
local _ = require("../vendor/compose/core")
local _ = require("./content_types")
local _ = require("./media_props")
local ContentValuesModule = require("./content_values")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./content_props")
local _ = require("./control_types")
local _ = require("./input_props")
local ReducedFunction = require("./motion").reduced
local FeedbackPaintModule = require("./feedback_paint")
local config = {
	label = true,
	icon = true,
	onActivate = true,
	enabled = true,
	busy = true
}
local config1 = { items = true, label = true }
local config2 = { label = true, status = true, icon = true, name = true }
local config3 = { leading = true, trailing = true }

return function(p1, p2)
	-- upvalues: config (copy), config1 (copy), config3 (copy), config2 (copy), ContentValuesModule (copy), ReducedFunction (copy), OverlayPartsModule (copy), FeedbackPaintModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesUDim = p1.types.UDim
	local CellResult = Compose.cell(false)
	local CellResult1 = Compose.cell(true)
	local CellResult2 = Compose.cell(1)
	local CellResult3 = Compose.cell(nil)
	local CellResult4 = Compose.cell({})
	
	local function nonempty(Text: string): boolean
		return type(Text) == "string" and string.find(Text, "%S") ~= nil
	end
	
	local function text(p3): boolean
		return type(p3) == "string"
	end
	
	local function _(Ancestor, Ancestor1)
		return Ancestor ~= nil and (Ancestor == Ancestor1 or Ancestor:IsDescendantOf(Ancestor1))
	end
	
	local function fields(Badges, p3, BadgesName)
		assert(type(Badges) == "table", `Facet UI.Card: {BadgesName} must be a table`)
		
		for badge in Badges do
			assert(type(badge) == "string" and p3[badge], `Facet UI.Card: {BadgesName} has the unknown field '{tostring(badge)}'`)
		end
	end
	
	p2.Card = p1.construct("Card", function(Frame: Frame)
		-- upvalues: ReadFunction (copy), fields (copy), config (upval), config1 (upval), config3 (upval), config2 (upval), ContentValuesModule (upval), p1 (copy), nonempty (copy), text (copy), CellResult3 (copy), CellResult (copy), TypesEnum (copy), Compose (copy), ReducedFunction (upval), CellResult4 (copy), Runtime (copy), CellResult1 (copy), CellResult2 (copy), TypesUDim (copy), TypesUDim2 (copy), Host (copy), p2 (copy), OverlayPartsModule (upval), FeedbackPaintModule (upval)
		assert(Frame.artwork == nil or type(Frame.artwork) == "function", "Facet UI.Card: artwork must be a function that returns a GuiObject")
		local HasFoundAt = true
		
		if Frame.image ~= nil then
			local ReadResult: string = ReadFunction(Frame.image)
			HasFoundAt = type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil
		end
		assert(HasFoundAt, "Facet UI.Card: image must be a nonempty image string")
		local HasImage: boolean = Frame.image ~= nil or Frame.artwork ~= nil
		local ReadResult: string = ReadFunction(Frame.title)
		assert(type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil, "Facet UI.Card: title is required: a nonempty string")
		assert(Frame.caption == nil or type((ReadFunction(Frame.caption))) == "string", "Facet UI.Card: caption must be a string")
		local ImageAspectRatio = Frame.imageAspectRatio or 1.7777777777777777
		assert(type(ImageAspectRatio) == "number" and ImageAspectRatio > 0 and ImageAspectRatio < 1e999, "Facet UI.Card: imageAspectRatio must be a positive finite number")
		assert(Frame.imageFraming == nil or (Frame.imageFraming == "fit" or Frame.imageFraming == "crop"), "Facet UI.Card: imageFraming must be fit or crop")
		assert(Frame.ringTarget == nil or (Frame.ringTarget == "card" or Frame.ringTarget == "media"), "Facet UI.Card: ringTarget must be card or media")
		local Reveal = Frame.reveal or "automatic"
		assert(Reveal == "automatic" or Reveal == "always", "Facet UI.Card: reveal must be automatic or always")
		assert(Frame.onActivate == nil or type(Frame.onActivate) == "function", "Facet UI.Card: onActivate must be a function")
		assert(Frame.browseTarget == nil or type(Frame.browseTarget) == "function", "Facet UI.Card: browseTarget must be a function that returns the browse stop")
		local PrimaryAction = Frame.primaryAction
		
		if PrimaryAction ~= nil then
			fields(PrimaryAction, config, "primaryAction")
			local ReadResult1: string = ReadFunction(PrimaryAction.label)
			assert(type(ReadResult1) == "string" and string.find(ReadResult1, "%S") ~= nil, "Facet UI.Card: primaryAction.label must be a nonempty string")
			assert(type(PrimaryAction.onActivate) == "function", "Facet UI.Card: primaryAction.onActivate is required")
		end
		local Menu = Frame.menu
		
		if Menu ~= nil then
			fields(Menu, config1, "menu")
			assert(Menu.items ~= nil, "Facet UI.Card: menu.items is required")
		end
		local HasPrimaryAction: boolean = PrimaryAction ~= nil or Menu ~= nil
		local Badges = Frame.badges
		
		if Badges ~= nil then
			fields(Badges, config3, "badges")
			assert(HasImage, "Facet UI.Card: badges need image or artwork")
			
			local function _(p4, p5)
				-- upvalues: fields (upval), config2 (upval)
				if p5 == nil then return end
				fields(p5, config2, `badges.{p4}`)
				local HasFoundAt = true
				
				if p5.label == nil then
					HasFoundAt = false
					
					if p5.icon ~= nil then
						local Name: string = p5.name
						HasFoundAt = type(Name) == "string" and string.find(Name, "%S") ~= nil
					end
				end
				assert(HasFoundAt, `Facet UI.Card: badges.{p4} needs a label, or an icon and a name`)
			end
			
			local Leading = Badges.leading
			
			if Leading ~= nil then
				fields(Leading, config2, "badges.leading")
				local HasFoundAt1 = true
				
				if Leading.label == nil then
					HasFoundAt1 = false
					
					if Leading.icon ~= nil then
						local Name: string = Leading.name
						HasFoundAt1 = type(Name) == "string" and string.find(Name, "%S") ~= nil
					end
				end
				assert(HasFoundAt1, "Facet UI.Card: badges.leading needs a label, or an icon and a name")
			end
			local Trailing = Badges.trailing
			
			if Trailing ~= nil then
				fields(Trailing, config2, "badges.trailing")
				local HasFoundAt2 = true
				
				if Trailing.label == nil then
					HasFoundAt2 = false
					
					if Trailing.icon ~= nil then
						local Name: string = Trailing.name
						HasFoundAt2 = type(Name) == "string" and string.find(Name, "%S") ~= nil
					end
				end
				assert(HasFoundAt2, "Facet UI.Card: badges.trailing needs a label, or an icon and a name")
			end
		end
		local Card = ContentValuesModule(p1, "Card")
		local Title = if type(Frame.title) == "string" then Frame.title else Card.legal("title", Frame.title, nonempty, "must be a nonempty string")
		local Image = if Frame.image == nil then "" elseif type(Frame.image) == "string" then Frame.image else Card.legal("image", Frame.image, nonempty, "must be a nonempty image string")
		local Caption = if Frame.caption == nil then "" elseif type(Frame.caption) == "string" then Frame.caption else Card.legal("caption", Frame.caption, text, "must be a string")
		
		local function Enabled(p4): boolean
			-- upvalues: ReadFunction (upval), Frame (copy)
			return ReadFunction(Frame.enabled, p4) ~= false
		end
		
		local GuiService = p1.config.services.GuiService
		local UserInputService = p1.config.services.UserInputService
		local ObserveResult = if GuiService then p1.selection.observe() else CellResult3
		local UchEnabled = if UserInputService then p1.observe.TouchEnabled(UserInputService) else CellResult
		local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else nil
		
		local _ = function(Callback): boolean
			-- upvalues: PreferredInputResult (copy), TypesEnum (upval)
			return PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch
		end
		
		local CellResult5 = Compose.cell(false)
		local CellResult6 = if HasPrimaryAction then Compose.cell(false) else CellResult
		local CellResult7 = if Menu then Compose.cell(false) else CellResult
		local CellResult8 = if Frame.onActivate then Compose.cell(false) else CellResult
		local ReducedResult = ReducedFunction(p1)
		local Object = nil
		local v1 = nil
		local v2 = nil
		local CellResult9 = if HasPrimaryAction then Compose.cell({}) else CellResult4
		
		local function holding(More)
			-- upvalues: Compose (upval), p1 (upval), TypesEnum (upval), Runtime (upval)
			local CellResult = Compose.cell(false)
			local GuiStateResult = p1.observe.GuiState(More)
			
			local function _(Input): boolean
				-- upvalues: TypesEnum (upval)
				return Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch
			end
			
			Runtime.connect(More, "InputBegan", function(Input)
				-- upvalues: TypesEnum (upval), CellResult (copy)
				if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch then
					CellResult:set(true)
				end
			end)
			Runtime.connect(More, "InputEnded", function(Input)
				-- upvalues: TypesEnum (upval), CellResult (copy)
				if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch then
					CellResult:set(false)
				end
			end)
			
			return Compose.formula(function(Callback)
				-- upvalues: CellResult (copy), GuiStateResult (copy), TypesEnum (upval)
				return Callback(CellResult) or Callback(GuiStateResult) == TypesEnum.GuiState.Press
			end)
		end
		
		local HasOnActivate: boolean = Frame.onActivate ~= nil or Frame.browseTarget ~= nil
		local FormulaResult = if GuiService then Compose.formula(function(Callback)
			-- upvalues: ObserveResult (copy), Object (ref)
			local CallbackResult = Callback(ObserveResult)
			local Ancestor = Object
			
			return CallbackResult ~= nil and (Ancestor ~= nil and (CallbackResult ~= nil and (CallbackResult == Ancestor or CallbackResult:IsDescendantOf(Ancestor))))
		end) else CellResult
		local FormulaResult1 = if Frame.browseTarget then Compose.formula(function(Callback): boolean
			-- upvalues: ObserveResult (copy), Frame (copy)
			local CallbackResult = Callback(ObserveResult)
			local BrowseTargetResult = if Frame.browseTarget then Frame.browseTarget() else nil
			
			return CallbackResult ~= nil and (BrowseTargetResult ~= nil and CallbackResult == BrowseTargetResult)
		end) else CellResult
		local FormulaResult2 = if HasPrimaryAction then Compose.formula(function(Callback): boolean
			-- upvalues: CellResult8 (copy), CellResult9 (copy)
			if Callback(CellResult8) then
				return true
			end
			for _, value in Callback(CellResult9) do
				if Callback(value) then
					return true
				end
			end
			return false
		end) else CellResult8
		local FormulaResult3 = Compose.formula(function(Callback)
			-- upvalues: CellResult5 (copy), FormulaResult (copy), FormulaResult2 (copy), CellResult7 (copy), CellResult6 (copy), FormulaResult1 (copy)
			return Callback(CellResult5) or (Callback(FormulaResult) or (Callback(FormulaResult2) or (Callback(CellResult7) or (Callback(CellResult6) or Callback(FormulaResult1)))))
		end)
		
		local _ = function(Callback): boolean
			-- upvalues: UchEnabled (copy), PreferredInputResult (copy), TypesEnum (upval)
			return Callback(UchEnabled) == true or PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch
		end
		
		local function v74(Callback): boolean
			-- upvalues: Reveal (copy), UchEnabled (copy), PreferredInputResult (copy), TypesEnum (upval)
			return Reveal == "always" or (Callback(UchEnabled) == true or PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch)
		end
		
		local CellResult10 = if Reveal == "always" or not HasOnActivate then CellResult1 else Compose.formula(function(Callback)
			-- upvalues: UchEnabled (copy), PreferredInputResult (copy), TypesEnum (upval), FormulaResult3 (copy)
			return Callback(UchEnabled) == true or PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch or Callback(FormulaResult3)
		end)
		local FormulaResult4 = Compose.formula(function(Callback)
			-- upvalues: PreferredInputResult (copy), TypesEnum (upval), FormulaResult3 (copy)
			return not (PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch) and Callback(FormulaResult3)
		end)
		local Snappy = p1.motionSpring("snappy")
		local SpringResult = Runtime.spring(function(Callback)
			-- upvalues: FormulaResult4 (copy), p1 (upval)
			return if Callback(FormulaResult4) then p1.metric("motion.materialize.lift", Callback) else 1
		end, { period = Snappy.period, damping = Snappy.damping })
		local FormulaResult5 = Compose.formula(function(Callback)
			-- upvalues: ReducedResult (copy), SpringResult (copy)
			return if ReducedResult(Callback) then 1 else Callback(SpringResult)
		end)
		local CellResult11 = if Reveal == "always" or not HasOnActivate then CellResult2 else Runtime.tween(function(Callback): number
			-- upvalues: CellResult10 (copy)
			return if Callback(CellResult10) then 1 else 0
		end, { seconds = p1.metric("motion.durations.cardFade") })
		
		local function enterActions(): boolean
			-- upvalues: Object (ref), ReadFunction (upval), Frame (copy), v1 (ref), PrimaryAction (copy), v2 (ref), CellResult6 (copy), GuiService (copy), p1 (upval)
			local Object1 = Object
			
			if ReadFunction(Frame.enabled, nil) == false or Object1 == nil or Object1.Parent == nil then
				return false
			end
			local v3 = if v1 and PrimaryAction and ReadFunction(PrimaryAction.enabled) ~= false and ReadFunction(PrimaryAction.busy) ~= true then v1 else v2
			
			if v3 == nil then
				return false
			end
			CellResult6:set(true)
			
			if GuiService then
				p1.selection.set(v3)
			end
			return true
		end
		
		local function leaveActions()
			-- upvalues: CellResult6 (copy), GuiService (copy), Object (ref), p1 (upval), Frame (copy)
			if not CellResult6:peek() then return end
			CellResult6:set(false)
			
			if GuiService and Object then
				local GetResult = p1.selection.get()
				local Ancestor = Object
				
				if GetResult ~= nil and (GetResult == Ancestor or GetResult:IsDescendantOf(Ancestor)) then
					local BrowseTargetResult = if Frame.browseTarget then Frame.browseTarget() else nil
					
					if BrowseTargetResult and BrowseTargetResult.Parent then
						p1.selection.set(BrowseTargetResult)
						
						return
					end
					if Object.Parent then
						local Body = Object:FindFirstChild("Body")
						
						if Body and Body:IsA("GuiObject") and Body.Selectable then
							p1.selection.set(Body)
						end
					end
				end
			end
		end
		
		if Frame.controls then
			Frame.controls.enterActions = enterActions
			Frame.controls.leaveActions = leaveActions
			Frame.controls.engaged = FormulaResult3
			Frame.controls.revealed = CellResult10
			Frame.controls.scale = FormulaResult5
			Frame.controls.lifting = FormulaResult4
			Frame.controls.diagnostics = Card.list
		end
		local v3 = nil
		
		local function v95(_)
			return {}
		end
		
		if Badges then
			local function gap(p4)
				-- upvalues: TypesUDim (upval), p1 (upval)
				return TypesUDim.new(0, p1.metric("space.s", p4))
			end
			
			local config6 = {
				Name = "Badges",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 1),
				ZIndex = 2,
				Host.UIPadding({
					PaddingLeft = gap,
					PaddingRight = gap,
					PaddingTop = gap,
					PaddingBottom = gap
				})
			}
			local config7 = { Leading = Compose.cell(0), Trailing = Compose.cell(0) }
			local config8 = {
				Leading = Compose.cell(true),
				Trailing = Compose.cell(true)
			}
			
			local function corner(Name, Leading, p4)
				-- upvalues: ReadFunction (upval), config8 (copy), p1 (upval), TypesUDim2 (upval), TypesEnum (upval), Compose (upval), p2 (upval), config7 (copy), config6 (copy), Host (upval)
				if Leading ~= nil then
					local Label = Leading.label
					local v4 = ""
					
					local function _(p5): boolean
						-- upvalues: Leading (copy), ReadFunction (upval)
						local HasFoundAt = false
						
						if Leading.name ~= nil then
							local ReadResult: string = ReadFunction(Leading.icon, p5)
							HasFoundAt = type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil
						end
						return HasFoundAt
					end
					
					local config = {
						label = function(p5)
							-- upvalues: ReadFunction (upval), Label (copy), v4 (ref), Leading (copy)
							local ReadResult: string = ReadFunction(Label, p5)
							
							if type(ReadResult) == "string" and (type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil) then
								v4 = ReadResult
							else
								local HasFoundAt = false
								
								if Leading.name ~= nil then
									local ReadResult1: string = ReadFunction(Leading.icon, p5)
									HasFoundAt = type(ReadResult1) == "string" and string.find(ReadResult1, "%S") ~= nil
								end
								if HasFoundAt then
									return nil
								end
							end
							return if Label == nil then nil else v4
						end,
						status = Leading.status,
						icon = Leading.icon,
						name = Leading.name,
						Visible = config8[Name]
					}
					config6[#config6 + 1] = Host.Frame({
						Name = Name,
						BackgroundTransparency = 1,
						AnchorPoint = p1.types.Vector2.new(p4, 0),
						Position = TypesUDim2.fromScale(p4, 0),
						Size = TypesUDim2.fromOffset(0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.XY,
						Compose.show(function(p5): boolean
							-- upvalues: Label (copy), ReadFunction (upval), Leading (copy)
							local HasFoundAt = true
							
							if Label ~= nil then
								local ReadResult: string = ReadFunction(Label, p5)
								HasFoundAt = type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil
								
								if not HasFoundAt then
									HasFoundAt = false
									
									if Leading.name ~= nil then
										local ReadResult1: string = ReadFunction(Leading.icon, p5)
										HasFoundAt = type(ReadResult1) == "string" and string.find(ReadResult1, "%S") ~= nil
									end
								end
							end
							return HasFoundAt
						end, function()
							-- upvalues: p2 (upval), config (copy), p1 (upval), Compose (upval), config7 (upval), Name (copy)
							local BadgeResult = p2.Badge(config)
							BadgeResult:AddTag("facet-badge-on-media")
							local AbsoluteSizeResult = p1.observe.AbsoluteSize(BadgeResult)
							Compose.watch(function(Callback)
								-- upvalues: config7 (upval), Name (upval), AbsoluteSizeResult (copy)
								config7[Name]:set(Callback(AbsoluteSizeResult).X)
							end)
							Compose.cleanup(function()
								-- upvalues: config7 (upval), Name (upval)
								config7[Name]:set(0)
							end)
							
							return BadgeResult
						end)
					})
					
					return
				end
			end
			
			corner("Leading", Badges.leading, 0)
			corner("Trailing", Badges.trailing, 1)
			local Label = if Badges.trailing then Badges.trailing.label else nil
			local Label1 = if Badges.leading then Badges.leading.label else nil
			
			v95 = function(Callback)
				-- upvalues: ReadFunction (upval), config8 (copy), Label (copy), Label1 (copy)
				local List = {}
				
				local function _(p4, p5)
					-- upvalues: ReadFunction (upval), Callback (copy), config8 (upval), List (copy)
					local ReadResult: string = ReadFunction(p5, Callback)
					
					if not Callback(config8[p4]) and type(ReadResult) == "string" and (type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil) then
						table.insert(List, ReadResult)
					end
				end
				
				local ReadResult: string = ReadFunction(Label, Callback)
				
				if not Callback(config8.Trailing) and type(ReadResult) == "string" and (type(ReadResult) == "string" and string.find(ReadResult, "%S") ~= nil) then
					table.insert(List, ReadResult)
				end
				local ReadResult1: string = ReadFunction(Label1, Callback)
				
				if not Callback(config8.Leading) and type(ReadResult1) == "string" and (type(ReadResult1) == "string" and string.find(ReadResult1, "%S") ~= nil) then
					table.insert(List, ReadResult1)
				end
				return List
			end
			
			local FrameResult = Host.Frame(config6)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(FrameResult)
			local LayoutUnitResult = p1.layoutUnit(FrameResult)
			Compose.watch(function(Callback)
				-- upvalues: config7 (copy), AbsoluteSizeResult (copy), p1 (upval), LayoutUnitResult (copy), config8 (copy)
				local CallbackResult: number = Callback(config7.Leading)
				local CallbackResult1: number = Callback(config7.Trailing)
				local X: number = Callback(AbsoluteSizeResult).X
				local ScaledSpaceS = p1.metric("space.s", Callback) * Callback(LayoutUnitResult)
				
				local function _(p4: number): boolean
					-- upvalues: X (copy), ScaledSpaceS (copy)
					return p4 <= 0 or (X <= 0 or p4 + 2 * ScaledSpaceS <= X)
				end
				
				local IsCallbackResultBelow: boolean = CallbackResult1 <= 0 or (X <= 0 or CallbackResult1 + 2 * ScaledSpaceS <= X)
				config8.Trailing:set(IsCallbackResultBelow)
				config8.Leading:set(if IsCallbackResultBelow and CallbackResult1 > 0 then CallbackResult <= 0 or (X <= 0 or CallbackResult + CallbackResult1 + 3 * ScaledSpaceS <= X) else CallbackResult <= 0 or (X <= 0 or CallbackResult + 2 * ScaledSpaceS <= X))
			end)
			v3 = FrameResult
		end
		local Artwork = Host.ImageLabel({
			Name = "Artwork",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Image = Image,
			Visible = HasImage,
			Size = if HasImage then TypesUDim2.new(1, 0, 0, 100000) else TypesUDim2.new(1, 0, 0, 0),
			ScaleType = if Frame.imageFraming == "fit" then TypesEnum.ScaleType.Fit else TypesEnum.ScaleType.Crop,
			Host.UIAspectRatioConstraint({
				AspectRatio = ImageAspectRatio,
				AspectType = TypesEnum.AspectType.FitWithinMaxSize,
				DominantAxis = TypesEnum.DominantAxis.Width
			})
		})
		
		if v3 then
			v3.Parent = Artwork
		end
		if Frame.artwork then
			local ArtworkFunction = Frame.artwork
			Runtime.mount(function()
				-- upvalues: ArtworkFunction (copy), OverlayPartsModule (upval), Runtime (upval), TypesUDim2 (upval)
				local ArtworkResult = ArtworkFunction()
				assert(OverlayPartsModule.instance(ArtworkResult) and ArtworkResult:IsA("GuiObject"), "Facet UI.Card: artwork must return a GuiObject")
				Runtime.decorate(ArtworkResult, { Size = TypesUDim2.fromScale(1, 1) })
				
				return ArtworkResult
			end, Artwork)
		end
		local Caption2 = if Badges then function(p4): string
			-- upvalues: ReadFunction (upval), Caption (copy), v95 (ref)
			local ReadResult: string = ReadFunction(Caption, p4)
			local List = {}
			
			for _, value in v95(p4) do
				if not string.find(string.lower(ReadResult), string.lower(value), 1, true) then
					table.insert(List, value)
				end
			end
			if ReadResult ~= "" then
				table.insert(List, ReadResult)
			end
			return table.concat(List, " · ")
		end else Caption
		
		local function closing(Callback)
			-- upvalues: TypesUDim (upval), HasImage (copy), ReadFunction (upval), Caption2 (copy), HasPrimaryAction (copy), Reveal (copy), UchEnabled (copy), PreferredInputResult (copy), TypesEnum (upval), p1 (upval)
			return TypesUDim.new(0, if HasImage and ReadFunction(Caption2, Callback) == "" then if HasPrimaryAction and (Reveal == "always" or (Callback(UchEnabled) == true or PreferredInputResult ~= nil and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch)) then 0 else p1.metric("space.s", Callback) else 0)
		end
		
		local function inset(p5)
			-- upvalues: TypesUDim (upval), p1 (upval), Host (upval), HasImage (copy), closing (copy)
			local function side(p6)
				-- upvalues: TypesUDim (upval), p1 (upval)
				return TypesUDim.new(0, p1.metric("space.s", p6))
			end
			
			return Host.UIPadding({
				PaddingLeft = side,
				PaddingRight = side,
				PaddingTop = if HasImage or p5 then nil else side,
				PaddingBottom = if p5 then side else closing
			})
		end
		
		local Label = p1.text({
			Name = "Title",
			LayoutOrder = 2,
			Text = Title,
			Size = TypesUDim2.fromScale(1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			TextWrapped = true,
			TextTruncate = TypesEnum.TextTruncate.AtEnd,
			inset(false)
		}, nil, "label")
		p1.clampLines(Label, 2)
		local Caption1 = nil
		
		if Frame.caption ~= nil or Badges ~= nil then
			local Caption3 = p1.text({
				Name = "Caption",
				LayoutOrder = 3,
				Text = Caption2,
				Visible = if type(Caption2) == "string" then Caption2 ~= "" else function(p5): boolean
					-- upvalues: ReadFunction (upval), Caption2 (copy)
					return ReadFunction(Caption2, p5) ~= ""
				end,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				TextWrapped = true,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				inset(true)
			}, nil, "caption")
			p1.clampLines(Caption3, 2)
			Caption3:AddTag("facet-secondary")
			Caption1 = Caption3
		end
		local Captions = {
			Host.UIPadding({
				PaddingLeft = TypesUDim.new(0, 0),
				PaddingRight = TypesUDim.new(0, 0),
				PaddingTop = TypesUDim.new(0, 0),
				PaddingBottom = TypesUDim.new(0, 0)
			}),
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Vertical,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = function(p5)
					-- upvalues: TypesUDim (upval), p1 (upval)
					return TypesUDim.new(0, p1.metric("space.xs", p5))
				end
			}),
			Artwork,
			Label
		}
		
		if Caption1 then
			table.insert(Captions, Caption1)
		end
		local Panel = nil
		
		if Frame.onActivate then
			local OnActivateFunction = Frame.onActivate
			local config4 = {
				Name = "Body",
				LayoutOrder = 1,
				label = "",
				name = Title,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				enabled = Enabled,
				onActivate = function(p5)
					-- upvalues: OnActivateFunction (copy)
					OnActivateFunction(p5)
				end,
				onPointerDown = function()
					-- upvalues: CellResult8 (copy)
					CellResult8:set(true)
				end,
				onPointerUp = function()
					-- upvalues: CellResult8 (copy)
					CellResult8:set(false)
				end,
				onPointerCancel = function()
					-- upvalues: CellResult8 (copy)
					CellResult8:set(false)
				end
			}
			
			for _, caption in Captions do
				config4[#config4 + 1] = caption
			end
			local ButtonResult = p2.Button(config4)
			ButtonResult:AddTag("facet-panel")
			Panel = ButtonResult
			Runtime.mount(function()
				-- upvalues: Host (upval), FormulaResult4 (copy)
				return Host.UIShadow({ Name = "LiftShadow", Enabled = FormulaResult4 })
			end, ButtonResult)
		else
			local config5 = {
				Name = "Body",
				LayoutOrder = 1,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Attributes = { label = Title }
			}
			
			for _, caption1 in Captions do
				config5[#config5 + 1] = caption1
			end
			Panel = p1.styled(Host.Frame(config5), "panel")
		end
		p1.styled(Panel, "card-body")
		Panel:AddTag("facet-card-part")
		
		local _ = function(p5)
			-- upvalues: ReadFunction (upval), Frame (copy), p1 (upval), CellResult10 (copy)
			return ReadFunction(Frame.enabled, p5) ~= false and p1.readSource(CellResult10, p5)
		end
		
		local _ = function(p5)
			-- upvalues: p1 (upval)
			return 2 * p1.metric("radii.panel", p5)
		end
		
		local function actionRow(p5)
			-- upvalues: PrimaryAction (copy), ReadFunction (upval), Frame (copy), p1 (upval), CellResult10 (copy), Host (upval), TypesEnum (upval), p2 (upval), v1 (ref), holding (copy), Menu (copy), Enabled (copy), CellResult7 (copy), v2 (ref), CellResult9 (copy), Compose (upval), CellResult6 (copy), TypesUDim2 (upval), TypesUDim (upval), Reveal (copy), ReducedResult (copy), CellResult11 (copy)
			local List = {}
			local List1 = {}
			
			if PrimaryAction then
				local Primary = p2.Button({
					Name = "Primary",
					LayoutOrder = 1,
					label = PrimaryAction.label,
					icon = PrimaryAction.icon,
					appearance = "emphasis",
					busy = PrimaryAction.busy,
					enabled = function(p6): boolean
						-- upvalues: ReadFunction (upval), Frame (upval), PrimaryAction (copy)
						return ReadFunction(Frame.enabled, p6) ~= false and ReadFunction(PrimaryAction.enabled, p6) ~= false
					end,
					onActivate = function()
						-- upvalues: ReadFunction (upval), Frame (upval), p1 (upval), CellResult10 (upval), PrimaryAction (copy)
						if ReadFunction(Frame.enabled, nil) ~= false and p1.readSource(CellResult10, nil) then
							PrimaryAction.onActivate()
						end
					end,
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				})
				v1 = Primary
				table.insert(List1, holding(Primary))
				table.insert(List, Primary)
			end
			if Menu then
				local More = p2.Menu({
					Name = "More",
					LayoutOrder = 2,
					trigger = p2.Button({
						label = "",
						icon = "more",
						name = Menu.label or "More",
						enabled = Enabled
					}),
					items = Menu.items,
					isPresented = CellResult7,
					enabled = Enabled
				})
				v2 = More
				table.insert(List1, holding(More))
				table.insert(List, More)
			end
			CellResult9:set(List1)
			Compose.cleanup(function()
				-- upvalues: v1 (upval), v2 (upval), CellResult9 (upval)
				v1 = nil
				v2 = nil
				CellResult9:set({})
			end)
			
			local function selectionBehavior(Callback)
				-- upvalues: CellResult6 (upval), TypesEnum (upval)
				return if Callback(CellResult6) then TypesEnum.SelectionBehavior.Stop else TypesEnum.SelectionBehavior.Escape
			end
			
			local config = {
				Name = "Row",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				SelectionGroup = true,
				SelectionBehaviorUp = selectionBehavior,
				SelectionBehaviorDown = selectionBehavior,
				SelectionBehaviorLeft = selectionBehavior,
				SelectionBehaviorRight = selectionBehavior,
				Host.UIListLayout({
					Wraps = true,
					FillDirection = TypesEnum.FillDirection.Horizontal,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					Padding = function(p6)
						-- upvalues: TypesUDim (upval), p1 (upval)
						return TypesUDim.new(0, p1.metric("space.s", p6))
					end
				})
			}
			
			for _, value in List do
				config[#config + 1] = value
			end
			config.ZIndex = 2
			
			if Reveal == "automatic" then
				local function side(p6)
					-- upvalues: TypesUDim (upval), p1 (upval)
					return TypesUDim.new(0, p1.metric("space.s", p6))
				end
				
				config[#config + 1] = Host.UIPadding({
					PaddingLeft = side,
					PaddingRight = side,
					PaddingTop = function(p6)
						-- upvalues: TypesUDim (upval), p1 (upval)
						return TypesUDim.new(0, p1.metric("space.s", p6) + 2 * p1.metric("radii.panel", p6))
					end,
					PaddingBottom = side
				})
			end
			local FrameResult = Host.Frame(config)
			local Panel = p1.styled(Host.Frame({
				Name = "Plate",
				Size = TypesUDim2.fromScale(1, 1),
				Visible = Reveal == "automatic"
			}), "panel")
			Panel:AddTag("facet-card-part")
			
			if p5 then
				Panel:AddTag("facet-card-inflow")
			end
			return p1.fade({
				Name = "Reveal",
				LayoutOrder = 2,
				AnchorPoint = p1.types.Vector2.new(0, if p5 then 0 else 1),
				Position = TypesUDim2.fromScale(0, if p5 then 0 else 1),
				ZIndex = if p5 then 0 else 2,
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Interactable = CellResult10,
				GroupTransparency = function(Callback): number
					-- upvalues: ReducedResult (upval), CellResult10 (upval), CellResult11 (upval)
					return if ReducedResult(Callback) then if Callback(CellResult10) then 0 else 1 else 1 - Callback(CellResult11)
				end,
				Panel,
				FrameResult
			})
		end
		
		local _ = function(): boolean
			-- upvalues: Object (ref)
			local Parent = Object and Object.Parent
			
			return Parent ~= nil and Parent:FindFirstChildWhichIsA("UIGridStyleLayout") ~= nil
		end
		
		local FrameResult = Host.Frame(p1.props(Frame, {
			"image", "artwork", "title", "caption", "imageAspectRatio", "imageFraming",
			"onActivate", "primaryAction", "menu", "reveal", "browseTarget", "enabled",
			"controls", "ringTarget", "badges"
		}, {
			Name = "Card",
			BackgroundTransparency = if HasImage then 1 else nil,
			Size = TypesUDim2.fromScale(1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			MouseEnter = function()
				-- upvalues: CellResult5 (copy)
				CellResult5:set(true)
			end,
			MouseLeave = function()
				-- upvalues: CellResult5 (copy)
				CellResult5:set(false)
			end,
			Attributes = {
				FacetReveal = Reveal,
				FacetRevealed = Reveal == "always" or not HasOnActivate or CellResult10,
				FacetEngaged = FormulaResult3,
				FacetLifting = FormulaResult4,
				FacetHovered = CellResult5,
				FacetFocusWithin = if GuiService then FormulaResult else false,
				FacetPressing = if Frame.onActivate or HasPrimaryAction then FormulaResult2 else false,
				FacetBrowsing = if Frame.browseTarget then FormulaResult1 else false,
				FacetEntered = if HasPrimaryAction then CellResult6 else false,
				FacetMenuOpen = if Menu then CellResult7 else false,
				FacetBody = if Frame.onActivate then "button" else "informational"
			},
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Vertical,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = function(p6)
					-- upvalues: TypesUDim (upval), Reveal (copy), p1 (upval)
					return TypesUDim.new(0, if Reveal == "always" then p1.metric("space.s", p6) else -(2 * p1.metric("radii.panel", p6)))
				end
			}),
			Panel,
			Host.UIScale({
				Name = "Lift",
				Scale = function(Callback)
					-- upvalues: FormulaResult5 (copy), Object (ref)
					local CallbackResult = Callback(FormulaResult5)
					local Parent = Object and Object.Parent
					local HasUIGridStyleLayout: boolean = Parent ~= nil and Parent:FindFirstChildWhichIsA("UIGridStyleLayout") ~= nil
					
					return if HasUIGridStyleLayout then 1 else CallbackResult
				end
			}),
			Compose.show(function(Callback)
				-- upvalues: FormulaResult4 (copy), FormulaResult5 (copy), ReducedResult (copy), Object (ref)
				local CallbackResult = Callback(FormulaResult4) or Callback(FormulaResult5) ~= 1
				
				if CallbackResult then
					CallbackResult = not ReducedResult(Callback)
					
					if CallbackResult then
						local Parent = Object and Object.Parent
						CallbackResult = Parent ~= nil and Parent:FindFirstChildWhichIsA("UIGridStyleLayout") ~= nil
					end
				end
				return CallbackResult
			end, function()
				-- upvalues: FeedbackPaintModule (upval), p1 (upval), Object (ref), Host (upval), FormulaResult5 (copy), Frame (copy), TypesEnum (upval), Compose (upval)
				FeedbackPaintModule(p1, assert(Object), Host.UIScale({ Name = "PaintLift", Scale = FormulaResult5 }), {
					reflow = true,
					Size = Frame.Size,
					AutomaticSize = Frame.AutomaticSize or TypesEnum.AutomaticSize.Y
				})
				
				return Compose.fragment(function()
					return {}
				end)
			end),
			if HasPrimaryAction then Compose.show(v74, function()
				-- upvalues: actionRow (copy)
				return actionRow(true)
			end, function()
				-- upvalues: Host (upval), actionRow (copy)
				return Host.Folder("ActionOverlay")({ actionRow(false) })
			end) else nil
		}))
		
		if not HasImage then
			p1.styled(FrameResult, "panel")
			FrameResult:AddTag("facet-card-text")
			Host.UIPadding({ Parent = Compose.static(FrameResult) })
		end
		Object = FrameResult
		local AbsoluteSizeResult1 = if Frame.onActivate or Frame.controls then p1.observe.AbsoluteSize(FrameResult) else nil
		
		if Frame.onActivate then
			local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(Panel)
			local AbsoluteSizeResult3 = if Frame.ringTarget == "media" then p1.observe.AbsoluteSize(Artwork) else assert(AbsoluteSizeResult1)
			local FormulaResult6 = Compose.formula(function(Callback)
				-- upvalues: AbsoluteSizeResult2 (copy), AbsoluteSizeResult3 (copy)
				local Y: number = Callback(AbsoluteSizeResult2).Y
				
				return if Y > 0 then Callback(AbsoluteSizeResult3).Y / Y else 1
			end)
			Compose.watch(function(Callback)
				-- upvalues: Panel (ref), FormulaResult6 (copy)
				Panel:SetAttribute("FacetFocusHeight", Callback(FormulaResult6))
			end)
		end
		if Frame.Position == nil then
			Runtime.decorate(FrameResult, {
				AnchorPoint = function(Callback)
					-- upvalues: FormulaResult5 (copy), ReadFunction (upval), Frame (copy), p1 (upval), Object (ref)
					local Largest = math.max(Callback(FormulaResult5), 0.001)
					local ReadResult = ReadFunction(Frame.AnchorPoint, Callback) or p1.types.Vector2.new(0, 0)
					local LargestRatio = (1 - 1 / Largest) / 2
					local Parent = Object and Object.Parent
					local HasUIGridStyleLayout: boolean = Parent ~= nil and Parent:FindFirstChildWhichIsA("UIGridStyleLayout") ~= nil
					
					return if HasUIGridStyleLayout then ReadResult else ReadResult + p1.types.Vector2.new(LargestRatio, LargestRatio)
				end
			})
		end
		if Frame.controls then
			local v4 = assert(AbsoluteSizeResult1)
			Frame.controls.revealExtent = Compose.formula(function(Callback)
				-- upvalues: v4 (copy)
				return { body = Callback(v4).Y }
			end)
		end
		if Frame.browseTarget then
			local BrowseTargetFunction = Frame.browseTarget
			local v5 = nil
			local MountResult = nil
			Compose.watch(function(Callback: (any) -> ())
				-- upvalues: ObserveResult (copy), BrowseTargetFunction (copy), v5 (ref), MountResult (ref), Runtime (upval), Host (upval), FormulaResult5 (copy)
				Callback(ObserveResult)
				local BrowseTargetResult = BrowseTargetFunction()
				
				if BrowseTargetResult == v5 then return end
				if MountResult then
					MountResult()
					MountResult = nil
				end
				v5 = BrowseTargetResult
				
				if BrowseTargetResult then
					MountResult = Runtime.mount(function()
						-- upvalues: Host (upval), FormulaResult5 (upval)
						return Host.UIScale({ Name = "CardLift", Scale = FormulaResult5 })
					end, BrowseTargetResult)
				end
			end)
			Compose.cleanup(function()
				-- upvalues: MountResult (ref)
				if MountResult then
					MountResult()
				end
			end)
		end
		if HasPrimaryAction then
			Compose.watch(function(p6)
				-- upvalues: ReadFunction (upval), Frame (copy), CellResult6 (copy), leaveActions (copy)
				if ReadFunction(Frame.enabled, p6) == false and CellResult6:peek() then
					leaveActions()
				end
			end)
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), CellResult6 (copy), CellResult7 (copy), FrameResult (copy)
				local CallbackResult = Callback(ObserveResult)
				
				if CellResult6:peek() and not CellResult7:peek() and CallbackResult ~= nil and (CallbackResult == nil or CallbackResult ~= FrameResult and not CallbackResult:IsDescendantOf(FrameResult)) then
					CellResult6:set(false)
				end
			end)
			p1.action(FrameResult, "CardCancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, function(Callback): boolean
				-- upvalues: CellResult6 (copy), CellResult7 (copy)
				return Callback(CellResult6) and not Callback(CellResult7)
			end, leaveActions, { priority = 1500 })
			
			if UserInputService then
				Runtime.connect(UserInputService, "InputBegan", function(Input)
					-- upvalues: CellResult6 (copy), CellResult7 (copy), TypesEnum (upval), FrameResult (copy)
					if not CellResult6:peek() or CellResult7:peek() then return end
					if Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 and Input.UserInputType ~= TypesEnum.UserInputType.Touch then return end
					local AbsolutePosition = FrameResult.AbsolutePosition
					local AbsoluteSize = FrameResult.AbsoluteSize
					local Position = Input.Position
					
					if Position.X < AbsolutePosition.X or Position.Y < AbsolutePosition.Y or AbsolutePosition.X + AbsoluteSize.X < Position.X or AbsolutePosition.Y + AbsoluteSize.Y < Position.Y then
						CellResult6:set(false)
					end
				end)
			end
			Compose.cleanup(function()
				-- upvalues: CellResult6 (copy), GuiService (copy), p1 (upval), FrameResult (copy), Frame (copy)
				if CellResult6:peek() and GuiService then
					local GetResult = p1.selection.get()
					
					if GetResult ~= nil and (GetResult == FrameResult or GetResult:IsDescendantOf(FrameResult)) then
						CellResult6:set(false)
						local BrowseTargetResult = if Frame.browseTarget then Frame.browseTarget() else nil
						p1.selection.set(if BrowseTargetResult and BrowseTargetResult.Parent then if BrowseTargetResult ~= nil and (BrowseTargetResult == FrameResult or BrowseTargetResult:IsDescendantOf(FrameResult)) then nil else BrowseTargetResult else nil)
					end
				end
			end)
		end
		return FrameResult
	end)
end