local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local UtilAndTabModule = require(Components.UtilAndTab)
local MainViewVoiceChat = RoactModule.PureComponent:extend("MainViewVoiceChat")

function MainViewVoiceChat.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onStatsUpdated(Stats)
		-- upvalues: p1 (copy)
		p1:setState({ stats = Stats })
	end
	
	p1._statsUpdatedConnection = p1.props.VoiceChatData:Signal():Connect(p1.onStatsUpdated)
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0, stats = {} }
end

function MainViewVoiceChat.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewVoiceChat.didUpdate(p1)
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewVoiceChat.willUnmount(p1)
	if p1._statsUpdatedConnection then
		p1._statsUpdatedConnection:Disconnect()
		p1._statsUpdatedConnection = nil
	end
end

function MainViewVoiceChat.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy)
	local Size = p1.props.size
	local list = {
		{
			key = "rttMs",
			format = "Round-trip time: %f",
			defaultValue = 0
		},
		{
			key = "incomingPackets",
			format = "Incoming Packets: %d",
			defaultValue = 0
		},
		{
			key = "outgoingPackets",
			format = "Outgoing Packets: %d",
			defaultValue = 0
		},
		{
			key = "incomingPacketsLost",
			format = "Incoming Packets Lost: %d",
			defaultValue = 0
		},
		{
			key = "outgoingPacketsLost",
			format = "Outgoing Packets Lost: %d",
			defaultValue = 0
		}
	}
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3, Size = Size }, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, MainRowPadding)
		}),
		FramePadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 16) }),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList,
			refForParent = p1.utilRef
		}),
		StatsContainer = RoactModule.createElement("Frame", { LayoutOrder = 2, BackgroundTransparency = 1 }, {
			UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Labels = (function()
				-- upvalues: list (copy), RoactModule (upval), p1 (copy), ConstantsModule (upval)
				local TextLabels = {}
				
				for LayoutOrder, value in ipairs(list) do
					TextLabels[LayoutOrder] = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = LayoutOrder,
						Size = UDim2.fromOffset(200, 20),
						Text = string.format(value.format, p1.state.stats[value.key] or value.defaultValue),
						TextColor3 = ConstantsModule.Color.Text,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				end
				return RoactModule.createFragment(TextLabels)
			end)()
		})
	})
end

return DataConsumerModule(MainViewVoiceChat, "VoiceChatData")