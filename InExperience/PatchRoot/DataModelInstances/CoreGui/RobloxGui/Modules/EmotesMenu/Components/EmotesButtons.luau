local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent
local actions = parent.Actions
local thunks = parent.Thunks
local constantsModule = require(parent.Constants)
local getSegmentFromPositionModule = require(parent.Utility.GetSegmentFromPosition)
local focusSegmentModule = require(actions.FocusSegment)
local hideMenuModule = require(actions.HideMenu)
local playEmoteModule = require(thunks.PlayEmote)
local emotesButtons = roactModule.PureComponent:extend("EmotesButtons")

local function _(p0, p1)
	-- upvalues: constantsModule (ref)
	local var10 = p0.AbsoluteSize.X / 2
	
	return var10 * constantsModule.InnerCircleSizeRatio < p1.Magnitude and p1.Magnitude < var10
end

local function getSegmentFromInput(a, b)
	-- upvalues: constantsModule (ref), getSegmentFromPositionModule (ref)
	local var11 = Vector2.new(b.Position.X, b.Position.Y) - a.AbsolutePosition - a.AbsoluteSize / 2
	local vector2 = Vector2.new(var11.X, -var11.Y)
	local var13 = a.AbsoluteSize.X / 2
	
	return if var13 * constantsModule.InnerCircleSizeRatio < vector2.Magnitude and vector2.Magnitude < var13 then getSegmentFromPositionModule(vector2) else 0
end

local _ = function(value)
	if #value == 0 then
		return
	end
	return value[math.random(1, #value)]
end

local _ = function(p2)
	-- upvalues: constantsModule (ref)
	return constantsModule.EmotesImage:format(p2)
end

function emotesButtons.render(p3)
	-- upvalues: constantsModule (ref), roactModule (ref), getSegmentFromInput (ref)
	local currentEmotes = p3.props.emotesPage.currentEmotes
	local emotesInfo = p3.props.emotesPage.emotesInfo
	local t = {}
	
	for i, v in pairs(currentEmotes) do
		local var15 = emotesInfo[v]
		
		if constantsModule.EmotesPerPage >= i then
			warn("EmotesMenu: Number of emotes in page exceeds max emotes per page")
			break
		end
		local var16 = 360 / constantsModule.EmotesPerPage * (i - 1) + constantsModule.SegmentsStartRotation
		local var17 = constantsModule.InnerCircleSizeRatio / 2
		local var18 = (1 - constantsModule.InnerCircleSizeRatio) / 2 - constantsModule.SlotNumberSize - constantsModule.ImageOutsidePadding
		local var19 = var18 / 2 + constantsModule.SlotNumberSize - constantsModule.ImageOutsidePadding / 2
		local var20 = math.cos(math.rad(var16))
		local var21 = math.sin(math.rad(var16))
		t[i] = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = constantsModule.EmotesImage:format(if #var15 == 0 then nil else var15[math.random(1, #var15)]),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5 + var17 * var20 + var19 * var20, 0, 0.5 + var17 * var21 + var19 * var21, 0),
			Size = UDim2.new(var18, 0, var18, 0)
		}, {
			AsspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
		})
	end
	return roactModule.createElement("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
		Text = "",
		[roactModule.Event.InputChanged] = function(p4, p5)
			-- upvalues: getSegmentFromInput (copy), p3 (ref)
			local userInputType = p5.UserInputType
			
			if userInputType == Enum.UserInputType.MouseMovement or userInputType == Enum.UserInputType.Touch then
				local var22 = getSegmentFromInput(p4, p5)
				
				if var22 == p3.props.emotesWheel.focusedSegmentIndex then return end
				if p3.props.emotesPage.currentEmotes[var22] then
					p3.props.focusSegment(var22)
					
					return
				end
				p3.props.focusSegment(0)
			end
		end,
		[roactModule.Event.Activated] = function(p6, p7)
			-- upvalues: getSegmentFromInput (copy), p3 (ref)
			local var23 = getSegmentFromInput(p6, p7)
			
			if var23 == 0 then
				p3.props.hideMenu()
				
				return
			end
			local var24 = p3.props.emotesPage.currentEmotes[var23]
			
			if not var24 then return end
			local var25 = p3.props.emotesPage.emotesInfo[var24]
			
			if var25 then
				p3.props.playEmote(var24, var23, if #var25 == 0 then nil else var25[math.random(1, #var25)])
				
				return
			end
		end,
		[roactModule.Event.MouseLeave] = function()
			-- upvalues: p3 (ref)
			p3.props.focusSegment(0)
		end
	}, t)
end

return roactRoduxModule.connect(function(p8)
	return {
		displayOptions = p8.displayOptions,
		emotesPage = p8.emotesPage,
		emotesWheel = p8.emotesWheel
	}
end, function(p9)
	-- upvalues: playEmoteModule (ref), focusSegmentModule (ref), hideMenuModule (ref)
	return {
		playEmote = function(p10, p11, p12)
			-- upvalues: p9 (ref), playEmoteModule (copy)
			return p9(playEmoteModule(p10, p11, p12))
		end,
		focusSegment = function(p13)
			-- upvalues: p9 (ref), focusSegmentModule (copy)
			return p9(focusSegmentModule(p13))
		end,
		hideMenu = function()
			-- upvalues: p9 (ref), hideMenuModule (copy)
			return p9(hideMenuModule())
		end
	}
end)(emotesButtons)