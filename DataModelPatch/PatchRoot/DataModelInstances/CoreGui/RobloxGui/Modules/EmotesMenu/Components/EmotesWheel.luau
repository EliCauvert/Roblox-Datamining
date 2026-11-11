local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local VRService = game:GetService("VRService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local Parent = script.Parent
local Parent1 = Parent.Parent
local Actions = Parent1.Actions
local ConstantsModule = require(Parent1.Constants)
local GetSegmentFromPositionModule = require(Parent1.Utility.GetSegmentFromPosition)
local EmotesButtonsModule = require(Parent.EmotesButtons)
local SlotNumbersModule = require(Parent.SlotNumbers)
local WheelBackgroundModule = require(Parent.WheelBackground)
local FocusSegmentModule = require(Actions.FocusSegment)
local HideMenuModule = require(Actions.HideMenu)
local PlayEmoteModule = require(Parent1.Thunks.PlayEmote)
local Value = Enum.ContextActionPriority.High.Value
local EmotesWheel = RoactModule.PureComponent:extend("EmotesWheel")

local function _(p1)
	if #p1 == 0 then return end
	return p1[math.random(1, #p1)]
end

function EmotesWheel.bindActions(p1)
	-- upvalues: ConstantsModule (copy), GetSegmentFromPositionModule (copy), ContextActionService (copy), Value (copy)
	if not p1.actionsBound then
		ContextActionService:BindActionAtPriority(ConstantsModule.EmoteSelectionAction, function(_, _, p2)
			-- upvalues: ConstantsModule (upval), GetSegmentFromPositionModule (upval), p1 (copy)
			local _Vector2 = Vector2.new(p2.Position.X, p2.Position.Y)
			
			if _Vector2.Magnitude < ConstantsModule.ThumbstickThreshold then return end
			local SegmentFromPositionModule = GetSegmentFromPositionModule(_Vector2)
			
			if SegmentFromPositionModule == p1.props.emotesWheel.focusedSegmentIndex then return end
			if p1.props.emotesPage.currentEmotes[SegmentFromPositionModule] then
				p1.props.focusSegment(SegmentFromPositionModule)
				
				return
			else
				p1.props.focusSegment(0)
			end
		end, false, Value, ConstantsModule.SelectionThumbstick)
		ContextActionService:BindActionAtPriority(ConstantsModule.PlaySelectedAction, function(_, UserInputState, _)
			-- upvalues: p1 (copy)
			if UserInputState == Enum.UserInputState.Begin then
				local FocusedSegmentIndex = p1.props.emotesWheel.focusedSegmentIndex
				local CurrentEmote = p1.props.emotesPage.currentEmotes[FocusedSegmentIndex]
				
				if not CurrentEmote then return end
				local Emotes = p1.props.emotesPage.emotesInfo[CurrentEmote]
				
				if not Emotes then return end
				p1.props.playEmote(CurrentEmote, FocusedSegmentIndex, if #Emotes == 0 then nil else Emotes[math.random(1, #Emotes)])
			end
		end, false, Value, ConstantsModule.PlayEmoteButton)
		ContextActionService:BindActionAtPriority(ConstantsModule.CloseMenuAction, function(_, UserInputState, _)
			-- upvalues: p1 (copy)
			if UserInputState == Enum.UserInputState.Begin then
				p1.props.hideMenu()
			end
		end, false, Value, unpack({
			ConstantsModule.EmoteMenuCloseKey,
			ConstantsModule.EmoteMenuCloseButton,
			ConstantsModule.EmoteMenuCloseButtonSecondary
		}))
		ContextActionService:BindActionAtPriority(ConstantsModule.LeaveMenuDontSinkInputAction, function(_, UserInputState, _)
			-- upvalues: p1 (copy)
			if UserInputState == Enum.UserInputState.Begin then
				p1.props.hideMenu()
			end
			return Enum.ContextActionResult.Pass
		end, false, Value, unpack(ConstantsModule.LeaveMenuNoSinkInputs))
		ContextActionService:BindActionAtPriority(ConstantsModule.ActivateEmoteSlotAction, function(_, UserInputState, Input)
			-- upvalues: ConstantsModule (upval), p1 (copy)
			if UserInputState ~= Enum.UserInputState.Begin then return end
			local v1 = nil
			
			for i, emoteSlotKey in ipairs(ConstantsModule.EmoteSlotKeys) do
				if emoteSlotKey == Input.KeyCode then
					v1 = i
					break
				end
			end
			if not v1 then return end
			local CurrentEmote = p1.props.emotesPage.currentEmotes[v1]
			
			if not CurrentEmote then return end
			local Emotes = p1.props.emotesPage.emotesInfo[CurrentEmote]
			
			if Emotes then
				p1.props.playEmote(CurrentEmote, v1, if #Emotes == 0 then nil else Emotes[math.random(1, #Emotes)])
				
				return
			end
		end, false, Value, unpack(ConstantsModule.EmoteSlotKeys))
		ContextActionService:BindCoreActionAtPriority(ConstantsModule.VirtualCursorSinkAction, function(_, _, _)
			return Enum.ContextActionResult.Sink
		end, false, Value, Enum.KeyCode.ButtonSelect)
		p1.actionsBound = true
		
		return
	end
end

function EmotesWheel.unbindActions(p2)
	-- upvalues: ContextActionService (copy), ConstantsModule (copy)
	if p2.actionsBound then
		ContextActionService:UnbindAction(ConstantsModule.CloseMenuAction)
		ContextActionService:UnbindAction(ConstantsModule.EmoteSelectionAction)
		ContextActionService:UnbindAction(ConstantsModule.PlaySelectedAction)
		ContextActionService:UnbindAction(ConstantsModule.LeaveMenuDontSinkInputAction)
		ContextActionService:UnbindAction(ConstantsModule.ActivateEmoteSlotAction)
		ContextActionService:UnbindCoreAction(ConstantsModule.VirtualCursorSinkAction)
		p2.actionsBound = false
	end
end

function EmotesWheel.addCursorOverride(p2)
	-- upvalues: VRService (copy), MouseIconOverrideService (copy), ConstantsModule (copy), GamepadService (copy)
	if VRService.VREnabled then return end
	if p2.isUsingGamepad and not p2.isCursorHidden then
		MouseIconOverrideService.push(ConstantsModule.CursorOverrideName, Enum.OverrideMouseIconBehavior.ForceHide)
		GamepadService.GamepadCursorEnabled = false
		p2.isCursorHidden = true
	end
end

function EmotesWheel.removeCursorOverride(p2)
	-- upvalues: MouseIconOverrideService (copy), ConstantsModule (copy)
	if p2.isCursorHidden then
		MouseIconOverrideService.pop(ConstantsModule.CursorOverrideName)
		p2.isCursorHidden = false
	end
end

function EmotesWheel.connectListeners(p2)
	-- upvalues: UserInputService (copy), ConstantsModule (copy)
	p2.inputTypeChangedListener = UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
		-- upvalues: ConstantsModule (upval), p2 (copy)
		if ConstantsModule.GamepadInputTypes[LastInputType] then
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

function EmotesWheel.disconnectListeners(p2)
	p2.inputTypeChangedListener:Disconnect()
end

function EmotesWheel.didUpdate(p2)
	if p2.props.displayOptions.menuVisible then
		p2:bindActions()
		p2:addCursorOverride()
		
		return
	else
		p2:unbindActions()
		p2:removeCursorOverride()
	end
end

function EmotesWheel.didMount(p2)
	if p2.props.displayOptions.menuVisible then
		p2:bindActions()
	end
	p2:connectListeners()
end

function EmotesWheel.willUnmount(p2)
	p2:unbindActions()
	p2:disconnectListeners()
end

function EmotesWheel.render(p2)
	-- upvalues: RoactModule (copy), WheelBackgroundModule (copy), EmotesButtonsModule (copy), SlotNumbersModule (copy)
	return RoactModule.createElement("Frame", {
		Active = true,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = p2.props.displayOptions.menuVisible
	}, {
		MouseUnlock = RoactModule.createElement("TextButton", {
			Modal = true,
			Text = "",
			Transparency = 1,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		Back = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Background = RoactModule.createElement(WheelBackgroundModule)
		}),
		Front = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			EmotesButtons = RoactModule.createElement(EmotesButtonsModule),
			SlotNumbers = RoactModule.createElement(SlotNumbersModule)
		})
	})
end

return RoactRoduxModule.connect(function(p2)
	return {
		displayOptions = p2.displayOptions,
		emotesWheel = p2.emotesWheel,
		emotesPage = p2.emotesPage
	}
end, function(Callback)
	-- upvalues: PlayEmoteModule (copy), FocusSegmentModule (copy), HideMenuModule (copy)
	return {
		playEmote = function(p2, p3, p4)
			-- upvalues: Callback (copy), PlayEmoteModule (upval)
			return Callback(PlayEmoteModule(p2, p3, p4))
		end,
		focusSegment = function(p2)
			-- upvalues: Callback (copy), FocusSegmentModule (upval)
			return Callback(FocusSegmentModule(p2))
		end,
		hideMenu = function()
			-- upvalues: Callback (copy), HideMenuModule (upval)
			return Callback(HideMenuModule())
		end
	}
end)(EmotesWheel)