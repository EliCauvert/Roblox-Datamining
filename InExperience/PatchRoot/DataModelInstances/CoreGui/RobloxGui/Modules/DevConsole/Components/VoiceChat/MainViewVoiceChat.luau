local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local utilAndTabModule = require(components.UtilAndTab)
local mainViewVoiceChat = roactModule.PureComponent:extend("MainViewVoiceChat")

function mainViewVoiceChat.init(p0)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1)
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onStatsUpdated(p2)
		-- upvalues: p0 (ref)
		p0:setState({ stats = p2 })
	end
	
	p0._statsUpdatedConnection = p0.props.VoiceChatData:Signal():Connect(p0.onStatsUpdated)
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0, stats = {} }
end

function mainViewVoiceChat.didMount(p3)
	p3:setState({ utilTabHeight = p3.utilRef.current.Size.Y.Offset })
end

function mainViewVoiceChat.didUpdate(p4)
	local size = p4.utilRef.current.Size
	
	if size.Y.Offset ~= p4.state.utilTabHeight then
		p4:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewVoiceChat.willUnmount(p5)
	if p5._statsUpdatedConnection then
		p5._statsUpdatedConnection:Disconnect()
		p5._statsUpdatedConnection = nil
	end
end

function mainViewVoiceChat.render(p6)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref)
	local size = p6.props.size
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
			formFactor = p6.props.formFactor,
			tabList = p6.props.tabList,
			refForParent = p6.utilRef
		}),
		StatsContainer = roactModule.createElement("Frame", { LayoutOrder = 2, BackgroundTransparency = 1 }, {
			UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Labels = (function()
				-- upvalues: list (ref), roactModule (copy), p6 (ref), constantsModule (copy)
				local t = {}
				
				for i, v in ipairs(list) do
					t[i] = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = i,
						Size = UDim2.fromOffset(200, 20),
						Text = string.format(v.format, p6.state.stats[v.key] or v.defaultValue),
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