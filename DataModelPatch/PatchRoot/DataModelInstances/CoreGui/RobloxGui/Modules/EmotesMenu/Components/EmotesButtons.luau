local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local Actions = Parent.Actions
local ConstantsModule = require(Parent.Constants)
local GetSegmentFromPositionModule = require(Parent.Utility.GetSegmentFromPosition)
local FocusSegmentModule = require(Actions.FocusSegment)
local HideMenuModule = require(Actions.HideMenu)
local PlayEmoteModule = require(Parent.Thunks.PlayEmote)
local EmotesButtons = RoactModule.PureComponent:extend("EmotesButtons")

local function _(Frame, Offset): boolean
	-- upvalues: ConstantsModule (copy)
	local XRatio = Frame.AbsoluteSize.X / 2
	
	return XRatio * ConstantsModule.InnerCircleSizeRatio < Offset.Magnitude and Offset.Magnitude < XRatio
end

local function getSegmentFromInput(Frame: Frame, Input)
	-- upvalues: ConstantsModule (copy), GetSegmentFromPositionModule (copy)
	local VectorDelta = Vector2.new(Input.Position.X, Input.Position.Y) - Frame.AbsolutePosition - Frame.AbsoluteSize / 2
	local _Vector2 = Vector2.new(VectorDelta.X, -VectorDelta.Y)
	local XRatio = Frame.AbsoluteSize.X / 2
	local IsXRatioAbove: boolean = XRatio * ConstantsModule.InnerCircleSizeRatio < _Vector2.Magnitude and XRatio > _Vector2.Magnitude
	
	return if IsXRatioAbove then GetSegmentFromPositionModule(_Vector2) else 0
end

local _ = function(p1)
	if #p1 == 0 then return end
	return p1[math.random(1, #p1)]
end

local _ = function(p1)
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.EmotesImage:format(p1)
end

function EmotesButtons.render(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), getSegmentFromInput (copy)
	local EmotesInfo = p1.props.emotesPage.emotesInfo
	local ImageLabels = {}
	
	for i, currentEmote in pairs(p1.props.emotesPage.currentEmotes) do
		local Emotes = EmotesInfo[currentEmote]
		
		if ConstantsModule.EmotesPerPage < i then
			warn("EmotesMenu: Number of emotes in page exceeds max emotes per page")
			break
		else
			local NewEmotesPerPage = 360 / ConstantsModule.EmotesPerPage * (i - 1) + ConstantsModule.SegmentsStartRotation
			local InnerCircleSizeRatioRatio = ConstantsModule.InnerCircleSizeRatio / 2
			local InnerCircleSizeRatioDelta = (1 - ConstantsModule.InnerCircleSizeRatio) / 2 - ConstantsModule.SlotNumberSize - ConstantsModule.ImageOutsidePadding
			local InnerCircleSizeRatioDeltaDelta = InnerCircleSizeRatioDelta / 2 + ConstantsModule.SlotNumberSize - ConstantsModule.ImageOutsidePadding / 2
			local Cosine = math.cos((math.rad(NewEmotesPerPage)))
			local Sine = math.sin((math.rad(NewEmotesPerPage)))
			ImageLabels[i] = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Image = ConstantsModule.EmotesImage:format(if #Emotes == 0 then nil else Emotes[math.random(1, #Emotes)]),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5 + InnerCircleSizeRatioRatio * Cosine + InnerCircleSizeRatioDeltaDelta * Cosine, 0, 0.5 + InnerCircleSizeRatioRatio * Sine + InnerCircleSizeRatioDeltaDelta * Sine, 0),
				Size = UDim2.new(InnerCircleSizeRatioDelta, 0, InnerCircleSizeRatioDelta, 0)
			}, {
				AsspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
			})
			continue
		end
	end
	return RoactModule.createElement("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
		Text = "",
		[RoactModule.Event.InputChanged] = function(Frame, Input)
			-- upvalues: getSegmentFromInput (upval), p1 (copy)
			local UserInputType = Input.UserInputType
			
			if UserInputType == Enum.UserInputType.MouseMovement or UserInputType == Enum.UserInputType.Touch then
				local SegmentFromInput = getSegmentFromInput(Frame, Input)
				
				if SegmentFromInput == p1.props.emotesWheel.focusedSegmentIndex then return end
				if p1.props.emotesPage.currentEmotes[SegmentFromInput] then
					p1.props.focusSegment(SegmentFromInput)
					
					return
				end
				p1.props.focusSegment(0)
			end
		end,
		[RoactModule.Event.Activated] = function(Frame, p2)
			-- upvalues: getSegmentFromInput (upval), p1 (copy)
			local SegmentFromInput = getSegmentFromInput(Frame, p2)
			
			if SegmentFromInput == 0 then
				p1.props.hideMenu()
				
				return
			end
			local CurrentEmote = p1.props.emotesPage.currentEmotes[SegmentFromInput]
			
			if not CurrentEmote then return end
			local Emotes = p1.props.emotesPage.emotesInfo[CurrentEmote]
			
			if Emotes then
				p1.props.playEmote(CurrentEmote, SegmentFromInput, if #Emotes == 0 then nil else Emotes[math.random(1, #Emotes)])
				
				return
			end
		end,
		[RoactModule.Event.MouseLeave] = function()
			-- upvalues: p1 (copy)
			p1.props.focusSegment(0)
		end
	}, ImageLabels)
end

return RoactRoduxModule.connect(function(p2)
	return {
		displayOptions = p2.displayOptions,
		emotesPage = p2.emotesPage,
		emotesWheel = p2.emotesWheel
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
end)(EmotesButtons)