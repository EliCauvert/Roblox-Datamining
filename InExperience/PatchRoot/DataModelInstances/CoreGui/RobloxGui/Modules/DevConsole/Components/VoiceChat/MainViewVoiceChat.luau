local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local utilAndTabModule = require(components.UtilAndTab)
local mainViewVoiceChat = roactModule.PureComponent:extend("MainViewVoiceChat")

function mainViewVoiceChat.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onStatsUpdated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ stats = p2 })
	end
	
	p1._statsUpdatedConnection = p1.props.VoiceChatData:Signal():Connect(p1.onStatsUpdated)
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0, stats = {} }
end

function mainViewVoiceChat.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewVoiceChat.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewVoiceChat.willUnmount(p1)
	if p1._statsUpdatedConnection then
		p1._statsUpdatedConnection:Disconnect()
		p1._statsUpdatedConnection = nil
	end
end

function mainViewVoiceChat.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref)
	local size = p1.props.size
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
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3, Size = size }, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, mainRowPadding)
		}),
		FramePadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 16) }),
		UtilAndTab = roactModule.createElement(utilAndTabModule, {
			layoutOrder = 1,
			windowWidth = size.X.Offset,
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList,
			refForParent = p1.utilRef
		}),
		StatsContainer = roactModule.createElement("Frame", { LayoutOrder = 2, BackgroundTransparency = 1 }, {
			UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Labels = (function()
				-- upvalues: list (ref), roactModule (copy), p1 (ref), constantsModule (copy)
				local t = {}
				
				for i, v in ipairs(list) do
					t[i] = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = i,
						Size = UDim2.fromOffset(200, 20),
						Text = string.format(v.format, p1.state.stats[v.key] or v.defaultValue),
						TextColor3 = constantsModule.Color.Text,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				end
				return roactModule.createFragment(t)
			end)()
		})
	})
end

return dataConsumerModule(mainViewVoiceChat, "VoiceChatData")