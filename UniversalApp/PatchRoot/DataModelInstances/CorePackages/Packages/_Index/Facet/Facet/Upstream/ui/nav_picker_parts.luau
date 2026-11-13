local _ = require("./theme_types")
local _ = require("./types")
local _ = require("./navigation_types")
local CoreModule = require("../vendor/compose/core")

return function(p1, p2)
	-- upvalues: CoreModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function wrapWhenLong(Label, Callback, p3, p4)
		-- upvalues: p1 (copy), Compose (copy), CoreModule (upval), Host (copy), TypesUDim2 (copy), TypesEnum (copy)
		local TextResult = p1.observe.Text(Label)
		local TextSizeResult = p1.observeStyled.TextSize(Label)
		local FontFaceResult = p1.observeStyled.FontFace(Label)
		local TextFitsResult = p1.observe.TextFits(Label)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(p3)
		local FacetUIPickerWrapsCaptionsInsideAComposeOwner = assert(Compose.currentOwner(), "Facet UI.Picker wraps captions inside a Compose owner")
		local v1 = nil
		local TextTruncate = nil
		local v2 = ""
		local v3 = 0
		local Thread = nil
		
		local function widestWord()
			-- upvalues: CoreModule (upval), FacetUIPickerWrapsCaptionsInsideAComposeOwner (copy), v1 (ref), Compose (upval), p1 (upval), Host (upval), TypesUDim2 (upval), TypesEnum (upval), p3 (copy), FontFaceResult (copy), TextSizeResult (copy), Label (copy)
			if CoreModule.owner.isDisposed(FacetUIPickerWrapsCaptionsInsideAComposeOwner) then
				return 0
			end
			if v1 == nil then
				Compose.withOwner(FacetUIPickerWrapsCaptionsInsideAComposeOwner, function()
					-- upvalues: p1 (upval), v1 (upval), Host (upval), TypesUDim2 (upval), TypesEnum (upval), p3 (upval)
					p1.runtime.mount(function()
						-- upvalues: v1 (upval), Host (upval), TypesUDim2 (upval), TypesEnum (upval), p1 (upval)
						v1 = Host.TextLabel("WidestWord")({
							BackgroundTransparency = 1,
							TextTransparency = 1,
							Interactable = false,
							AutoLocalize = false,
							Text = "",
							Size = TypesUDim2.fromOffset(0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.XY
						})
						
						return p1.Host.Folder("WordMeasure")({ v1 })
					end, p3)
				end)
			end
			local Label1 = assert(v1)
			local PeekResult = TextSizeResult:peek()
			Label1.FontFace = FontFaceResult:peek()
			Label1.TextSize = PeekResult
			Label1.Text = string.gsub(Label.Text, "%s+", "\n")
			Label1.Text = ""
			
			return Label1.TextBounds.X
		end
		
		local function _(p5)
			-- upvalues: v2 (ref), Label (copy), widestWord (copy), TextTruncate (ref), TypesEnum (upval)
			if v2 == p5 and Label.TextWrapped and Label.TextBounds.X < widestWord() - 0.5 then
				TextTruncate = Label.TextTruncate
				Label.TextWrapped = false
				Label.TextTruncate = TypesEnum.TextTruncate.AtEnd
			end
		end
		
		local function recheck(p5)
			-- upvalues: Thread (ref), v2 (ref), Label (copy), widestWord (copy), TextTruncate (ref), TypesEnum (upval)
			if Thread and coroutine.status(Thread) == "suspended" then
				task.cancel(Thread)
			end
			Thread = nil
			
			if not task then return end
			local SpawnedThread = nil
			SpawnedThread = task.spawn(function()
				-- upvalues: v2 (upval), p5 (copy), Label (upval), widestWord (upval), TextTruncate (upval), TypesEnum (upval), Thread (upval), SpawnedThread (ref)
				for _ = 1, 10 do
					task.wait()
					
					if v2 ~= p5 or not Label.TextWrapped then break end
					if v2 == p5 and Label.TextWrapped and Label.TextBounds.X < widestWord() - 0.5 then
						TextTruncate = Label.TextTruncate
						Label.TextWrapped = false
						Label.TextTruncate = TypesEnum.TextTruncate.AtEnd
					end
				end
				if Thread == SpawnedThread then
					Thread = nil
				end
			end)
			
			if coroutine.status(SpawnedThread) ~= "dead" then
				Thread = SpawnedThread
			end
		end
		
		Compose.cleanup(function()
			-- upvalues: Thread (ref)
			if Thread and coroutine.status(Thread) == "suspended" then
				task.cancel(Thread)
			end
			Thread = nil
		end)
		Compose.watch(function(Callback1)
			-- upvalues: TextFitsResult (copy), AbsoluteSizeResult (copy), Callback (copy), TextResult (copy), TextSizeResult (copy), FontFaceResult (copy), Label (copy), TextTruncate (ref), v2 (ref), v3 (ref), p4 (copy), widestWord (copy), TypesEnum (upval), recheck (copy)
			Callback1(TextFitsResult)
			local X = Callback1(AbsoluteSizeResult).X
			local Text: string = `{Callback(Callback1)}|{Callback1(TextResult)}|{Callback1(TextSizeResult)}|{Callback1(FontFaceResult)}`
			
			if Label.TextWrapped or TextTruncate ~= nil then
				if Text ~= v2 or X > v3 then
					Label.TextWrapped = false
					
					if TextTruncate ~= nil then
						Label.TextTruncate = TextTruncate
						TextTruncate = nil
					end
				else
					if p4 and v2 == Text and Label.TextWrapped and Label.TextBounds.X < widestWord() - 0.5 then
						TextTruncate = Label.TextTruncate
						Label.TextWrapped = false
						Label.TextTruncate = TypesEnum.TextTruncate.AtEnd
					end
					return
				end
			end
			if not Label.TextFits then
				Label.TextWrapped = true
				v2 = Text
				v3 = X
				
				if p4 then
					recheck(Text)
				end
			end
		end)
	end
	
	local function sideChrome(p5, p6, p7): number
		-- upvalues: p1 (copy)
		local ReadResult = p1.read(p1.config.theme, p6)
		local Control = if ReadResult and ReadResult.chrome then ReadResult.chrome.control else nil
		local ContentInsets = if Control then Control.contentInsets else nil
		local PaddingX = if p7 then 0 else p1.controlSize(p5, "paddingX", p6)
		
		return math.max(PaddingX, ContentInsets and ContentInsets.left or 0) + math.max(PaddingX, ContentInsets and ContentInsets.right or 0)
	end
	
	local config = {
		standard = "standard",
		contrast = "contrast",
		utility = "utility"
	}
	local config1 = {
		filled = "filled",
		stroke = "stroke",
		utility = "utility"
	}
	
	return {
		keys = {
			"selected", "options", "style", "query", "placeholder", "label", "required",
			"multiple", "onChanging", "onChange", "enabled", "indicator", "axis", "sizing",
			"iconOnly", "textSize", "isPresented", "requiredMark", "hint", "errorText",
			"controlSize", "appearance", "corners", "maxHeight", "indicatorPosition",
			"valueAlignment"
		},
		appearanceFor = function(p5, p6)
			-- upvalues: config (copy), config1 (copy)
			if p6 == nil then
				return nil
			end
			if p5 == "menu" or p5 == "navigationLink" then
				if type(p6) ~= "string" or config[p6] == nil then
					error(`Facet UI.Picker: a {p5} appearance is standard | contrast | utility (got {tostring(p6)})`, 0)
				end
			elseif p5 == "segmented" then
				if type(p6) ~= "string" or config1[p6] == nil then
					error(`Facet UI.Picker: a segmented appearance is filled | stroke | utility (got {tostring(p6)})`, 0)
				end
			elseif p5 == "automatic" then
				if type(p6) ~= "string" or config[p6] == nil and config1[p6] == nil then
					error("Facet UI.Picker: appearance is standard | contrast | utility | filled | stroke " .. `(got {tostring(p6)})`, 0)
				end
			else
				error(`Facet UI.Picker: a {p5} picker takes no appearance`, 0)
			end
			assert(type(p6) == "string")
			
			return p6
		end,
		derive = function(Callback, ...)
			-- upvalues: Compose (copy)
			for i = 1, select("#", ...) do
				local Selected = select(i, ...)
				
				if Compose.isValue(Selected) or type(Selected) == "function" then
					return Callback
				end
			end
			return Callback(nil)
		end,
		layoutWidth = function(p5)
			-- upvalues: p1 (copy), Host (copy), TypesUDim2 (copy), Compose (copy)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(p5)
			local v4 = nil
			p1.runtime.mount(function()
				-- upvalues: v4 (ref), Host (upval), TypesUDim2 (upval)
				v4 = Host.Frame("Unit")({ Visible = false, Size = TypesUDim2.fromOffset(1, 1) })
				
				return Host.Folder("UnitContainer")({ v4 })
			end, p5)
			local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(assert(v4))
			
			return Compose.formula(function(Callback): number
				-- upvalues: AbsoluteSizeResult1 (copy), AbsoluteSizeResult (copy)
				local X: number = Callback(AbsoluteSizeResult1).X
				local XRatio = Callback(AbsoluteSizeResult).X / (if X > 0 then X else 1)
				
				return if XRatio > 0 then XRatio else 1e999
			end)
		end,
		wrapWhenLong = wrapWhenLong,
		sideChrome = sideChrome,
		wrapCaptions = function(Object, p5, Callback, Callback1)
			-- upvalues: sideChrome (copy), p1 (copy), TypesVector2 (copy), p2 (copy), Host (copy), wrapWhenLong (copy)
			local HasLeadingIcon = Object:FindFirstChild("LeadingIcon", true) ~= nil
			
			local function room(p6)
				-- upvalues: sideChrome (upval), p5 (copy), HasLeadingIcon (copy), p1 (upval), TypesVector2 (upval), Callback (copy)
				return TypesVector2.new(math.max(0, Callback(p6) - (sideChrome(p5, p6) + (if HasLeadingIcon then p1.controlSize(p5, "iconSize", p6) + 8 else 0))), 1e999)
			end
			
			for _, ChildName in { "Title", "Description" } do
				local Child = Object:FindFirstChild(ChildName, true)
				
				if Child and Child:IsA("TextLabel") then
					p2.attach(Child, { Host.UISizeConstraint({ MaxSize = room }) })
					wrapWhenLong(Child, function(p6): string
						-- upvalues: room (copy), Callback1 (copy)
						return `{room(p6).X}|{if Callback1 then Callback1(p6) else 0}`
					end, Object, Callback1 ~= nil)
				end
			end
		end,
		liveIcon = function(p6)
			-- upvalues: ReadFunction (copy)
			return if p6:peek().icon == nil then nil else function(Callback)
				-- upvalues: ReadFunction (upval), p6 (copy)
				return ReadFunction(Callback(p6).icon, Callback) or ""
			end
		end
	}
end