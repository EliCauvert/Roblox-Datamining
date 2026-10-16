local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local CellLabelModule = require(script.Parent.Parent.Parent.Components.CellLabel)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local CollapsibleSectionModule = require(script.Parent.CollapsibleSection)
local _ = require(script.Parent.VoiceDebugData)
local _UDim = UDim.new(0.13, 0)
local _UDim1 = UDim.new(0.11, 0)
local _UDim2 = UDim.new(0.11, 0)
local _UDim3 = UDim.new(0.12, 0)
local _UDim4 = UDim.new(0.11, 0)
local _UDim5 = UDim.new(0.14, 0)
local _UDim6 = UDim.new(0.1, 0)
local _UDim7 = UDim.new(0.09, 0)
local _UDim8 = UDim.new(0.09, 0)
local XScale: UDim = _UDim + _UDim1
local NewXScale: UDim = XScale + _UDim2
local XScale1: UDim = NewXScale + _UDim3
local NewXScale1: UDim = XScale1 + _UDim4
local XScale2: UDim = NewXScale1 + _UDim5
local NewXScale2: UDim = XScale2 + _UDim6
local XScale3: UDim = NewXScale2 + _UDim7
local TextBoxGray = ConstantsModule.Color.TextBoxGray

local function _(p1: number): string --[[ Line: 37 | Named "formatHexSsrc" ]]
	return if type(p1) == "number" and p1 == p1 and p1 % 1 == 0 then string.format("0x%08X", p1) else "—"
end

local _ = function(p1): string --[[ Line: 44 | Named "formatOrDash" ]]
	return if p1 == nil or p1 == "" then "—" else tostring(p1)
end

local _ = function(p1): string --[[ Line: 51 | Named "formatBool" ]]
	return if type(p1) == "boolean" then if p1 then "Yes" else "No" else "—"
end

local _ = function(p1): string --[[ Line: 58 | Named "formatBitrate" ]]
	if p1.culled == true then
		return "—"
	else
		local IncomingBitrateKbps = p1.incomingBitrateKbps
		
		return if type(IncomingBitrateKbps) == "number" then string.format("%.2f kbps", IncomingBitrateKbps) else "—"
	end
end

local _ = function(p1): string --[[ Line: 69 | Named "formatCodec" ]]
	if p1.culled == true then
		return "—"
	else
		local CodecName = p1.codecName
		
		return if CodecName == nil or CodecName == "" then "—" else tostring(CodecName)
	end
end

local function HeaderCell(p1) --[[ Line: 76 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = string.upper(p1.text),
		Size = p1.size,
		Position = p1.pos,
		Font = ConstantsModule.Font.MainWindowHeader,
		TextSize = ConstantsModule.DefaultFontSize.MainWindowHeader,
		TextColor3 = ConstantsModule.Color.BorderGray,
		TextXAlignment = Enum.TextXAlignment.Left
	})
end

local function SubscriptionsTable(p1) --[[ Line: 89 ]]
	-- upvalues: RoactModule (copy), TextBoxGray (copy), CellLabelModule (copy), _UDim (copy), _UDim1 (copy), _UDim (copy), _UDim2 (copy), XScale (copy), _UDim3 (copy), NewXScale (copy), _UDim4 (copy), XScale1 (copy), _UDim5 (copy), NewXScale1 (copy), _UDim6 (copy), XScale2 (copy), _UDim7 (copy), NewXScale2 (copy), _UDim8 (copy), XScale3 (copy), HeaderCell (copy)
	local LayoutOrder = p1.layoutOrder
	local t = {}
	
	for LayoutOrder1, value in p1.subscriptions or {} do
		local IsCulled = value.culled == true
		local Text = "subscription" .. LayoutOrder1
		local CreateElementFunction2 = RoactModule.createElement
		local v1 = "Frame"
		local config = {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 20),
			LayoutOrder = LayoutOrder1,
			BackgroundColor3 = TextBoxGray,
			BackgroundTransparency = if IsCulled then 0.6 else 1
		}
		local AudioSsrc: number = value.audioSsrc
		local config1 = {
			text = if type(AudioSsrc) == "number" and AudioSsrc == AudioSsrc and AudioSsrc % 1 == 0 then string.format("0x%08X", AudioSsrc) else "—",
			size = UDim2.new(_UDim, UDim.new(1, 0)),
			pos = UDim2.new(0, 0, 0, 0)
		}
		local FeedReferenceId = value.feedReferenceId
		local config2 = {
			text = if FeedReferenceId == nil or FeedReferenceId == "" then "—" else tostring(FeedReferenceId),
			size = UDim2.new(_UDim1, UDim.new(1, 0)),
			pos = UDim2.new(_UDim, UDim.new(0, 0))
		}
		local UserId = value.userId
		local config3 = {
			text = if UserId == nil or UserId == "" then "—" else tostring(UserId),
			size = UDim2.new(_UDim2, UDim.new(1, 0)),
			pos = UDim2.new(XScale, UDim.new(0, 0))
		}
		local AudioMid = value.audioMid
		local config4 = {
			AudioSsrc = RoactModule.createElement(CellLabelModule, config1),
			FeedId = RoactModule.createElement(CellLabelModule, config2),
			UserId = RoactModule.createElement(CellLabelModule, config3),
			AudioMid = RoactModule.createElement(CellLabelModule, {
				text = if AudioMid == nil or AudioMid == "" then "—" else tostring(AudioMid),
				size = UDim2.new(_UDim3, UDim.new(1, 0)),
				pos = UDim2.new(NewXScale, UDim.new(0, 0)),
				textTruncate = Enum.TextTruncate.AtEnd
			})
		}
		local CreateElementFunction = RoactModule.createElement
		local t1 = {}
		local Formatted = nil
		
		if value.culled == true then
			Formatted = "—"
		else
			local IncomingBitrateKbps = value.incomingBitrateKbps
			Formatted = if type(IncomingBitrateKbps) == "number" then string.format("%.2f kbps", IncomingBitrateKbps) else "—"
		end
		t1.text = Formatted
		t1.size = UDim2.new(_UDim4, UDim.new(1, 0))
		t1.pos = UDim2.new(XScale1, UDim.new(0, 0))
		config4.Bitrate = CreateElementFunction(CellLabelModule, t1)
		local CreateElementFunction1 = RoactModule.createElement
		local t2 = {}
		local Text1 = nil
		
		if value.culled == true then
			Text1 = "—"
		else
			local CodecName = value.codecName
			Text1 = if CodecName == nil or CodecName == "" then "—" else tostring(CodecName)
		end
		t2.text = Text1
		t2.size = UDim2.new(_UDim5, UDim.new(1, 0))
		t2.pos = UDim2.new(NewXScale1, UDim.new(0, 0))
		t2.textTruncate = Enum.TextTruncate.AtEnd
		config4.Codec = CreateElementFunction1(CellLabelModule, t2)
		local Culled = value.culled
		config4.Culled = RoactModule.createElement(CellLabelModule, {
			text = if type(Culled) == "boolean" then if Culled then "Yes" else "No" else "—",
			size = UDim2.new(_UDim6, UDim.new(1, 0)),
			pos = UDim2.new(XScale2, UDim.new(0, 0))
		})
		local IsMuted = value.isMuted
		config4.Muted = RoactModule.createElement(CellLabelModule, {
			text = if type(IsMuted) == "boolean" then if IsMuted then "Yes" else "No" else "—",
			size = UDim2.new(_UDim7, UDim.new(1, 0)),
			pos = UDim2.new(NewXScale2, UDim.new(0, 0))
		})
		local IsMutedLocally = value.isMutedLocally
		config4.MutedLocally = RoactModule.createElement(CellLabelModule, {
			text = if type(IsMutedLocally) == "boolean" then if IsMutedLocally then "Yes" else "No" else "—",
			size = UDim2.new(_UDim8, UDim.new(1, 0)),
			pos = UDim2.new(XScale3, UDim.new(0, 0))
		})
		t[Text] = CreateElementFunction2(v1, config, config4)
	end
	if next(t) == nil then
		t.placeholder = RoactModule.createElement(CellLabelModule, {
			text = "—",
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Header = RoactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			AudioSsrc = RoactModule.createElement(HeaderCell, {
				text = "Audio Ssrc",
				size = UDim2.new(_UDim, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			FeedId = RoactModule.createElement(HeaderCell, {
				text = "Feed ID",
				size = UDim2.new(_UDim1, UDim.new(1, 0)),
				pos = UDim2.new(_UDim, UDim.new(0, 0))
			}),
			UserId = RoactModule.createElement(HeaderCell, {
				text = "User ID",
				size = UDim2.new(_UDim2, UDim.new(1, 0)),
				pos = UDim2.new(XScale, UDim.new(0, 0))
			}),
			AudioMid = RoactModule.createElement(HeaderCell, {
				text = "Audio Mid",
				size = UDim2.new(_UDim3, UDim.new(1, 0)),
				pos = UDim2.new(NewXScale, UDim.new(0, 0))
			}),
			Bitrate = RoactModule.createElement(HeaderCell, {
				text = "Bitrate",
				size = UDim2.new(_UDim4, UDim.new(1, 0)),
				pos = UDim2.new(XScale1, UDim.new(0, 0))
			}),
			Codec = RoactModule.createElement(HeaderCell, {
				text = "Codec",
				size = UDim2.new(_UDim5, UDim.new(1, 0)),
				pos = UDim2.new(NewXScale1, UDim.new(0, 0))
			}),
			Culled = RoactModule.createElement(HeaderCell, {
				text = "Culled",
				size = UDim2.new(_UDim6, UDim.new(1, 0)),
				pos = UDim2.new(XScale2, UDim.new(0, 0))
			}),
			Muted = RoactModule.createElement(HeaderCell, {
				text = "Muted",
				size = UDim2.new(_UDim7, UDim.new(1, 0)),
				pos = UDim2.new(NewXScale2, UDim.new(0, 0))
			}),
			MutedLocally = RoactModule.createElement(HeaderCell, {
				text = "Muted Locally",
				size = UDim2.new(_UDim8, UDim.new(1, 0)),
				pos = UDim2.new(XScale3, UDim.new(0, 0))
			})
		}),
		Rows = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Rows = RoactModule.createFragment(t)
		})
	})
end

return function(p2) --[[ Line: 240 | Named "SubscriptionsPanel" ]]
	-- upvalues: RoactModule (copy), CollapsibleSectionModule (copy), SubscriptionsTable (copy)
	return RoactModule.createElement(CollapsibleSectionModule, { title = "Subscriptions", layoutOrder = p2.layoutOrder }, {
		Table = RoactModule.createElement(SubscriptionsTable, { layoutOrder = 1, subscriptions = p2.subscriptions })
	})
end