local contextActionService = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local gamepadService = game:GetService("GamepadService")
local VRService = game:GetService("VRService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local parent = script.Parent
local parent_1 = parent.Parent
local actions = parent_1.Actions
local thunks = parent_1.Thunks
local constantsModule = require(parent_1.Constants)
local getSegmentFromPositionModule = require(parent_1.Utility.GetSegmentFromPosition)
local emotesButtonsModule = require(parent.EmotesButtons)
local slotNumbersModule = require(parent.SlotNumbers)
local wheelBackgroundModule = require(parent.WheelBackground)
local focusSegmentModule = require(actions.FocusSegment)
local hideMenuModule = require(actions.HideMenu)
local playEmoteModule = require(thunks.PlayEmote)
local value = Enum.ContextActionPriority.High.Value
local emotesWheel = roactModule.PureComponent:extend("EmotesWheel")

local function _(value) --[[ line: 36 | named "getRandomAssetId" ]]
	if #value == 0 then
		return
	end
	return value[math.random(1, #value)]
end

function emotesWheel.bindActions(p0) --[[ line: 45 ]]
	-- upvalues: constantsModule (ref), getSegmentFromPositionModule (ref), contextActionService (ref), value (ref)
	if p0.actionsBound then
		return
	end
	contextActionService:BindActionAtPriority(constantsModule.EmoteSelectionAction, function(_, _, p1) --[[ line: 50 | named "selectEmote" ]]
		-- upvalues: constantsModule (copy), getSegmentFromPositionModule (copy), p0 (ref)
		local vector2 = Vector2.new(p1.Position.X, p1.Position.Y)
		
		if vector2.Magnitude < constantsModule.ThumbstickThreshold then return end
		local var17 = getSegmentFromPositionModule(vector2)
		
		if var17 == p0.props.emotesWheel.focusedSegmentIndex then return end
		if p0.props.emotesPage.currentEmotes[var17] then
			p0.props.focusSegment(var17)
			
			return
		end
		p0.props.focusSegment(0)
	end, false, value, constantsModule.SelectionThumbstick)
	contextActionService:BindActionAtPriority(constantsModule.PlaySelectedAction, function(_, p2, _) --[[ line: 78 | named "playSelected" ]]
		-- upvalues: p0 (ref)
		if p2 == Enum.UserInputState.Begin then
			local focusedSegmentIndex = p0.props.emotesWheel.focusedSegmentIndex
			local var18 = p0.props.emotesPage.currentEmotes[focusedSegmentIndex]
			
			if not var18 then return end
			local var19 = p0.props.emotesPage.emotesInfo[var18]
			
			if not var19 then return end
			p0.props.playEmote(var18, focusedSegmentIndex, if #var19 == 0 then nil else var19[math.random(1, #var19)])
		end
	end, false, value, constantsModule.PlayEmoteButton)
	contextActionService:BindActionAtPriority(constantsModule.CloseMenuAction, function(_, p3, _) --[[ line: 106 | named "closeMenu" ]]
		-- upvalues: p0 (ref)
		if p3 == Enum.UserInputState.Begin then
			p0.props.hideMenu()
		end
	end, false, value, unpack({
		constantsModule.EmoteMenuCloseKey,
		constantsModule.EmoteMenuCloseButton,
		constantsModule.EmoteMenuCloseButtonSecondary
	}))
	contextActionService:BindActionAtPriority(constantsModule.LeaveMenuDontSinkInputAction, function(_, p4, _) --[[ line: 126 | named "closeMenuNoSink" ]]
		-- upvalues: p0 (ref)
		if p4 == Enum.UserInputState.Begin then
			p0.props.hideMenu()
		end
		return Enum.ContextActionResult.Pass
	end, false, value, unpack(constantsModule.LeaveMenuNoSinkInputs))
	contextActionService:BindActionAtPriority(constantsModule.ActivateEmoteSlotAction, function(_, p5, p6) --[[ line: 141 | named "activateEmoteByNumber" ]]
		-- upvalues: constantsModule (copy), p0 (ref)
		if p5 ~= Enum.UserInputState.Begin then return end
		local var20 = nil
		
		for i, v in ipairs(constantsModule.EmoteSlotKeys) do
			if v == p6.KeyCode then
				var20 = i
				break
			end
		end
		if not var20 then return end
		local var21 = p0.props.emotesPage.currentEmotes[var20]
		
		if not var21 then return end
		local var22 = p0.props.emotesPage.emotesInfo[var21]
		
		if var22 then
			p0.props.playEmote(var21, var20, if #var22 == 0 then nil else var22[math.random(1, #var22)])
			
			return
		end
	end, false, value, unpack(constantsModule.EmoteSlotKeys))
	contextActionService:BindCoreActionAtPriority(constantsModule.VirtualCursorSinkAction, function(_, _, _) --[[ line: 182 | named "sinkInput" ]]
		return Enum.ContextActionResult.Sink
	end, false, value, Enum.KeyCode.ButtonSelect)
	p0.actionsBound = true
end

function emotesWheel.unbindActions(p7) --[[ line: 196 ]]
	-- upvalues: contextActionService (ref), constantsModule (ref)
	if p7.actionsBound then
		contextActionService:UnbindAction(constantsModule.CloseMenuAction)
		contextActionService:UnbindAction(constantsModule.EmoteSelectionAction)
		contextActionService:UnbindAction(constantsModule.PlaySelectedAction)
		contextActionService:UnbindAction(constantsModule.LeaveMenuDontSinkInputAction)
		contextActionService:UnbindAction(constantsModule.ActivateEmoteSlotAction)
		contextActionService:UnbindCoreAction(constantsModule.VirtualCursorSinkAction)
		p7.actionsBound = false
	end
end

function emotesWheel.addCursorOverride(p8) --[[ line: 209 ]]
	-- upvalues: VRService (ref), mouseIconOverrideService (ref), constantsModule (ref), gamepadService (ref)
	if VRService.VREnabled then return end
	if p8.isUsingGamepad and not p8.isCursorHidden then
		mouseIconOverrideService.push(constantsModule.CursorOverrideName, Enum.OverrideMouseIconBehavior.ForceHide)
		gamepadService.GamepadCursorEnabled = false
		p8.isCursorHidden = true
	end
end

function emotesWheel.removeCursorOverride(p9) --[[ line: 222 ]]
	-- upvalues: mouseIconOverrideService (ref), constantsModule (ref)
	if p9.isCursorHidden then
		mouseIconOverrideService.pop(constantsModule.CursorOverrideName)
		p9.isCursorHidden = false
	end
end

function emotesWheel.connectListeners(p10) --[[ line: 230 ]]
	-- upvalues: userInputService (ref), constantsModule (ref)
	p10.inputTypeChangedListener = userInputService.LastInputTypeChanged:Connect(function(p11) --[[ line: 231 ]]
		-- upvalues: constantsModule (copy), p10 (ref)
		if constantsModule.GamepadInputTypes[p11] then
			p10.isUsingGamepad = true
			
			if p10.props.displayOptions.menuVisible then
				p10:addCursorOverride()
				
				return
			end
		else
			p10.isUsingGamepad = false
			p10:removeCursorOverride()
		end
	end)
end

function emotesWheel.disconnectListeners(p12) --[[ line: 246 ]]
	p12.inputTypeChangedListener:Disconnect()
end

function emotesWheel.didUpdate(p13) --[[ line: 250 ]]
	if p13.props.displayOptions.menuVisible then
		p13:bindActions()
		p13:addCursorOverride()
		
		return
	end
	p13:unbindActions()
	p13:removeCursorOverride()
end

function emotesWheel.didMount(p14) --[[ line: 262 ]]
	if p14.props.displayOptions.menuVisible then
		p14:bindActions()
	end
	p14:connectListeners()
end

function emotesWheel.willUnmount(p15) --[[ line: 270 ]]
	p15:unbindActions()
	p15:disconnectListeners()
end

function emotesWheel.render(p16) --[[ line: 276 ]]
	-- upvalues: roactModule (ref), wheelBackgroundModule (ref), emotesButtonsModule (ref), slotNumbersModule (ref)
	return roactModule.createElement("Frame", {
		Active = true,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = p16.props.displayOptions.menuVisible
	}, {
		MouseUnlock = roactModule.createElement("TextButton", {
			Modal = true,
			Text = "",
			Transparency = 1,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		Back = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Background = roactModule.createElement(wheelBackgroundModule)
		}),
		Front = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			EmotesButtons = roactModule.createElement(emotesButtonsModule),
			SlotNumbers = roactModule.createElement(slotNumbersModule)
		})
	})
end

return roactRoduxModule.connect(function(p17) --[[ line: 309 | named "mapStateToProps" ]]
	return {
		displayOptions = p17.displayOptions,
		emotesWheel = p17.emotesWheel,
		emotesPage = p17.emotesPage
	}
end, function(p18) --[[ line: 317 | named "mapDispatchToProps" ]]
	-- upvalues: playEmoteModule (ref), focusSegmentModule (ref), hideMenuModule (ref)
	return {
		playEmote = function(p19, p20, p21) --[[ line: 319 ]]
			-- upvalues: p18 (ref), playEmoteModule (copy)
			return p18(playEmoteModule(p19, p20, p21))
		end,
		focusSegment = function(p22) --[[ line: 323 ]]
			-- upvalues: p18 (ref), focusSegmentModule (copy)
			return p18(focusSegmentModule(p22))
		end,
		hideMenu = function() --[[ line: 327 ]]
			-- upvalues: p18 (ref), hideMenuModule (copy)
			return p18(hideMenuModule())
		end
	}
end)(emotesWheel)