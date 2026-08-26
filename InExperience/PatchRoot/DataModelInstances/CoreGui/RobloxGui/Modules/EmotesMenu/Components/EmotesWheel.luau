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

local function _(value)
	if #value == 0 then
		return
	end
	return value[math.random(1, #value)]
end

function emotesWheel.bindActions(p1)
	-- upvalues: constantsModule (ref), getSegmentFromPositionModule (ref), contextActionService (ref), value (ref)
	if p1.actionsBound then
		return
	end
	contextActionService:BindActionAtPriority(constantsModule.EmoteSelectionAction, function(_, _, p2)
		-- upvalues: constantsModule (copy), getSegmentFromPositionModule (copy), p1 (ref)
		local vector2 = Vector2.new(p2.Position.X, p2.Position.Y)
		
		if vector2.Magnitude < constantsModule.ThumbstickThreshold then return end
		local var1 = getSegmentFromPositionModule(vector2)
		
		if var1 == p1.props.emotesWheel.focusedSegmentIndex then return end
		if p1.props.emotesPage.currentEmotes[var1] then
			p1.props.focusSegment(var1)
			
			return
		end
		p1.props.focusSegment(0)
	end, false, value, constantsModule.SelectionThumbstick)
	contextActionService:BindActionAtPriority(constantsModule.PlaySelectedAction, function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			local focusedSegmentIndex = p1.props.emotesWheel.focusedSegmentIndex
			local var1 = p1.props.emotesPage.currentEmotes[focusedSegmentIndex]
			
			if not var1 then return end
			local var2 = p1.props.emotesPage.emotesInfo[var1]
			
			if not var2 then return end
			p1.props.playEmote(var1, focusedSegmentIndex, if #var2 == 0 then nil else var2[math.random(1, #var2)])
		end
	end, false, value, constantsModule.PlayEmoteButton)
	contextActionService:BindActionAtPriority(constantsModule.CloseMenuAction, function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.hideMenu()
		end
	end, false, value, unpack({
		constantsModule.EmoteMenuCloseKey,
		constantsModule.EmoteMenuCloseButton,
		constantsModule.EmoteMenuCloseButtonSecondary
	}))
	contextActionService:BindActionAtPriority(constantsModule.LeaveMenuDontSinkInputAction, function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.hideMenu()
		end
		return Enum.ContextActionResult.Pass
	end, false, value, unpack(constantsModule.LeaveMenuNoSinkInputs))
	contextActionService:BindActionAtPriority(constantsModule.ActivateEmoteSlotAction, function(_, p2, p3)
		-- upvalues: constantsModule (copy), p1 (ref)
		if p2 ~= Enum.UserInputState.Begin then return end
		local var1 = nil
		
		for i, v in ipairs(constantsModule.EmoteSlotKeys) do
			if v == p3.KeyCode then
				var1 = i
				break
			end
		end
		if not var1 then return end
		local var2 = p1.props.emotesPage.currentEmotes[var1]
		
		if not var2 then return end
		local var3 = p1.props.emotesPage.emotesInfo[var2]
		
		if var3 then
			p1.props.playEmote(var2, var1, if #var3 == 0 then nil else var3[math.random(1, #var3)])
			
			return
		end
	end, false, value, unpack(constantsModule.EmoteSlotKeys))
	contextActionService:BindCoreActionAtPriority(constantsModule.VirtualCursorSinkAction, function(_, _, _)
		return Enum.ContextActionResult.Sink
	end, false, value, Enum.KeyCode.ButtonSelect)
	p1.actionsBound = true
end

function emotesWheel.unbindActions(p2)
	-- upvalues: contextActionService (ref), constantsModule (ref)
	if p2.actionsBound then
		contextActionService:UnbindAction(constantsModule.CloseMenuAction)
		contextActionService:UnbindAction(constantsModule.EmoteSelectionAction)
		contextActionService:UnbindAction(constantsModule.PlaySelectedAction)
		contextActionService:UnbindAction(constantsModule.LeaveMenuDontSinkInputAction)
		contextActionService:UnbindAction(constantsModule.ActivateEmoteSlotAction)
		contextActionService:UnbindCoreAction(constantsModule.VirtualCursorSinkAction)
		p2.actionsBound = false
	end
end

function emotesWheel.addCursorOverride(p2)
	-- upvalues: VRService (ref), mouseIconOverrideService (ref), constantsModule (ref), gamepadService (ref)
	if VRService.VREnabled then return end
	if p2.isUsingGamepad and not p2.isCursorHidden then
		mouseIconOverrideService.push(constantsModule.CursorOverrideName, Enum.OverrideMouseIconBehavior.ForceHide)
		gamepadService.GamepadCursorEnabled = false
		p2.isCursorHidden = true
	end
end

function emotesWheel.removeCursorOverride(p2)
	-- upvalues: mouseIconOverrideService (ref), constantsModule (ref)
	if p2.isCursorHidden then
		mouseIconOverrideService.pop(constantsModule.CursorOverrideName)
		p2.isCursorHidden = false
	end
end

function emotesWheel.connectListeners(p2)
	-- upvalues: userInputService (ref), constantsModule (ref)
	p2.inputTypeChangedListener = userInputService.LastInputTypeChanged:Connect(function(p3)
		-- upvalues: constantsModule (copy), p2 (ref)
		if constantsModule.GamepadInputTypes[p3] then
			p2.isUsingGamepad = true
			
			if p2.props.displayOptions.menuVisible then
				p2:addCursorOverride()
				
				return
			end
		else
			p2.isUsingGamepad = false
			p2:removeCursorOverride()
		end
	end)
end

function emotesWheel.disconnectListeners(p2)
	p2.inputTypeChangedListener:Disconnect()
end

function emotesWheel.didUpdate(p2)
	if p2.props.displayOptions.menuVisible then
		p2:bindActions()
		p2:addCursorOverride()
		
		return
	end
	p2:unbindActions()
	p2:removeCursorOverride()
end

function emotesWheel.didMount(p2)
	if p2.props.displayOptions.menuVisible then
		p2:bindActions()
	end
	p2:connectListeners()
end

function emotesWheel.willUnmount(p2)
	p2:unbindActions()
	p2:disconnectListeners()
end

function emotesWheel.render(p2)
	-- upvalues: roactModule (ref), wheelBackgroundModule (ref), emotesButtonsModule (ref), slotNumbersModule (ref)
	return roactModule.createElement("Frame", {
		Active = true,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = p2.props.displayOptions.menuVisible
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

return roactRoduxModule.connect(function(p2)
	return {
		displayOptions = p2.displayOptions,
		emotesWheel = p2.emotesWheel,
		emotesPage = p2.emotesPage
	}
end, function(p2)
	-- upvalues: playEmoteModule (ref), focusSegmentModule (ref), hideMenuModule (ref)
	return {
		playEmote = function(p3, p4, p5)
			-- upvalues: p2 (ref), playEmoteModule (copy)
			return p2(playEmoteModule(p3, p4, p5))
		end,
		focusSegment = function(p3)
			-- upvalues: p2 (ref), focusSegmentModule (copy)
			return p2(focusSegmentModule(p3))
		end,
		hideMenu = function()
			-- upvalues: p2 (ref), hideMenuModule (copy)
			return p2(hideMenuModule())
		end
	}
end)(emotesWheel)