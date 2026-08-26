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

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	local var1 = p1.AbsoluteSize.X / 2
	
	return var1 * constantsModule.InnerCircleSizeRatio < p2.Magnitude and p2.Magnitude < var1
end

local function getSegmentFromInput(a, b)
	-- upvalues: constantsModule (ref), getSegmentFromPositionModule (ref)
	local var1 = Vector2.new(b.Position.X, b.Position.Y) - a.AbsolutePosition - a.AbsoluteSize / 2
	local vector2 = Vector2.new(var1.X, -var1.Y)
	local var2 = a.AbsoluteSize.X / 2
	
	return if var2 * constantsModule.InnerCircleSizeRatio < vector2.Magnitude and vector2.Magnitude < var2 then getSegmentFromPositionModule(vector2) else 0
end

local _ = function(value)
	if #value == 0 then
		return
	end
	return value[math.random(1, #value)]
end

local _ = function(p1)
	-- upvalues: constantsModule (ref)
	return constantsModule.EmotesImage:format(p1)
end

function emotesButtons.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref), getSegmentFromInput (ref)
	local currentEmotes = p1.props.emotesPage.currentEmotes
	local emotesInfo = p1.props.emotesPage.emotesInfo
	local t = {}
	
	for i, v in pairs(currentEmotes) do
		local var1 = emotesInfo[v]
		
		if constantsModule.EmotesPerPage >= i then
			warn("EmotesMenu: Number of emotes in page exceeds max emotes per page")
			break
		end
		local var2 = 360 / constantsModule.EmotesPerPage * (i - 1) + constantsModule.SegmentsStartRotation
		local var3 = constantsModule.InnerCircleSizeRatio / 2
		local var4 = (1 - constantsModule.InnerCircleSizeRatio) / 2 - constantsModule.SlotNumberSize - constantsModule.ImageOutsidePadding
		local var5 = var4 / 2 + constantsModule.SlotNumberSize - constantsModule.ImageOutsidePadding / 2
		local var6 = math.cos(math.rad(var2))
		local var7 = math.sin(math.rad(var2))
		t[i] = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = constantsModule.EmotesImage:format(if #var1 == 0 then nil else var1[math.random(1, #var1)]),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5 + var3 * var6 + var5 * var6, 0, 0.5 + var3 * var7 + var5 * var7, 0),
			Size = UDim2.new(var4, 0, var4, 0)
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
		[roactModule.Event.InputChanged] = function(p2, p3)
			-- upvalues: getSegmentFromInput (copy), p1 (ref)
			local userInputType = p3.UserInputType
			
			if userInputType == Enum.UserInputType.MouseMovement or userInputType == Enum.UserInputType.Touch then
				local var8 = getSegmentFromInput(p2, p3)
				
				if var8 == p1.props.emotesWheel.focusedSegmentIndex then return end
				if p1.props.emotesPage.currentEmotes[var8] then
					p1.props.focusSegment(var8)
					
					return
				end
				p1.props.focusSegment(0)
			end
		end,
		[roactModule.Event.Activated] = function(p2, p3)
			-- upvalues: getSegmentFromInput (copy), p1 (ref)
			local var8 = getSegmentFromInput(p2, p3)
			
			if var8 == 0 then
				p1.props.hideMenu()
				
				return
			end
			local var9 = p1.props.emotesPage.currentEmotes[var8]
			
			if not var9 then return end
			local var10 = p1.props.emotesPage.emotesInfo[var9]
			
			if var10 then
				p1.props.playEmote(var9, var8, if #var10 == 0 then nil else var10[math.random(1, #var10)])
				
				return
			end
		end,
		[roactModule.Event.MouseLeave] = function()
			-- upvalues: p1 (ref)
			p1.props.focusSegment(0)
		end
	}, t)
end

return roactRoduxModule.connect(function(p2)
	return {
		displayOptions = p2.displayOptions,
		emotesPage = p2.emotesPage,
		emotesWheel = p2.emotesWheel
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
end)(emotesButtons)