local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local iceCandidateParserModule = require(script.Parent.IceCandidateParser)
local collapsibleSectionModule = require(script.Parent.CollapsibleSection)
local _ = require(script.Parent.VoiceDebugData)
local getFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local uDim = UDim.new(0.55, 0)
local uDim_1 = UDim.new(0.25, 0)
local uDim_2 = UDim.new(0.2, 0)
local uDim_3 = UDim.new(0.4, 0)
local uDim_4 = UDim.new(0.3, 0)
local hoverGreen = constantsModule.Color.HoverGreen
local warningYellow = constantsModule.Color.WarningYellow
local errorRed = constantsModule.Color.ErrorRed
local unselectedGray = constantsModule.Color.UnselectedGray
local t = { complete = true, connected = true, stable = true }
local t_1 = { checking = true, connecting = true, new = true }
local t_2 = { failed = true, disconnected = true, closed = true }
local t_3 = {
	host = {
		background = Color3.fromRGB(13, 39, 64),
		text = Color3.fromRGB(95, 184, 255)
	},
	srflx = {
		background = Color3.fromRGB(42, 26, 48),
		text = Color3.fromRGB(176, 122, 240)
	},
	relay = {
		background = Color3.fromRGB(42, 32, 16),
		text = Color3.fromRGB(224, 176, 64)
	},
	prflx = {
		background = Color3.fromRGB(16, 42, 32),
		text = Color3.fromRGB(96, 200, 160)
	}
}
local t_4 = {
	background = Color3.fromRGB(28, 28, 28),
	text = Color3.fromRGB(107, 111, 117)
}
local uDim_5 = UDim.new(0.17, 0)
local uDim_6 = UDim.new(0.14, 0)
local uDim_7 = UDim.new(0.25, 0)
local uDim_8 = UDim.new(0.14, 0)
local uDim_9 = UDim.new(0.17, 0)
local uDim_10 = UDim.new(0.13, 0)

local function _(p1)
	return string.gsub(p1, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	})
end

local function GroupHeader(p1)
	-- upvalues: roactModule (ref), cellLabelModule (ref)
	local subtitle = p1.subtitle
	local formattedText = string.format("<b>%s</b>", string.gsub(p1.title, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}))
	
	if subtitle then
		formattedText ..= string.format("  <font color=\"#%s\">%s</font>", "B8B8B8", string.gsub(subtitle, "[<>&\"']", {
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;",
			["\""] = "&quot;",
			["'"] = "&apos;"
		}))
	end
	return roactModule.createElement(cellLabelModule, {
		richText = true,
		text = formattedText,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 20),
		pos = UDim2.new()
	})
end

local function HeaderCell(p1)
	-- upvalues: roactModule (ref), constantsModule (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = string.upper(p1.text),
		Size = p1.size,
		Position = p1.pos,
		Font = constantsModule.Font.MainWindowHeader,
		TextSize = constantsModule.DefaultFontSize.MainWindowHeader,
		TextColor3 = constantsModule.Color.BorderGray,
		TextXAlignment = Enum.TextXAlignment.Left
	})
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then "\226\128\148" else p1
end

local _ = function(vectorA)
	-- upvalues: t (ref), hoverGreen (ref), t_1 (ref), warningYellow (ref), t_2 (ref), errorRed (ref), unselectedGray (ref)
	if vectorA ~= nil then
		return if t[vectorA] then hoverGreen elseif t_1[vectorA] then warningYellow elseif t_2[vectorA] then errorRed else unselectedGray
	end
end

local _ = function(p1)
	-- upvalues: warningYellow (ref), errorRed (ref)
	return if p1 ~= warningYellow then p1 == errorRed else true
end

local function LegCell(p1)
	-- upvalues: roactModule (ref), cellLabelModule (ref)
	local color = p1.color
	local var1 = if color then 12 else 0
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		Position = p1.pos
	}, {
		Dot = color and roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 7, 0, 7),
			BackgroundColor3 = color
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}) or nil,
		Value = roactModule.createElement(cellLabelModule, {
			text = p1.text,
			size = UDim2.new(1, -var1, 1, 0),
			pos = UDim2.new(0, var1, 0, 0)
		})
	})
end

local function TransportStateTable(p1)
	-- upvalues: getFFlagVoiceDebugConsoleV2Module (ref), t (ref), hoverGreen (ref), t_1 (ref), warningYellow (ref), t_2 (ref), errorRed (ref), unselectedGray (ref), roactModule (ref), constantsModule (ref), cellLabelModule (ref), uDim_3 (ref), LegCell (ref), uDim_4 (ref), GroupHeader (ref), HeaderCell (ref)
	local t_6
	local connectivity = p1.connectivity or {}
	local layoutOrder = p1.layoutOrder
	local var1 = getFFlagVoiceDebugConsoleV2Module()
	local list = {
		{
			label = "ICE gathering",
			publish = connectivity.iceGatheringStatePublish,
			subscribe = connectivity.iceGatheringStateSubscribe
		},
		{
			label = "ICE connection",
			publish = connectivity.iceConnectionStatePublish,
			subscribe = connectivity.iceConnectionStateSubscribe
		},
		{
			label = "Signaling",
			publish = connectivity.signalingStatePublish,
			subscribe = connectivity.signalingStateSubscribe
		}
	}
	local t_3 = {}
	
	for i, v in list do
		local publish, var2
		if var1 then
			publish = v.publish
			
			if publish ~= nil then
				var2 = if t[publish] then hoverGreen elseif t_1[publish] then warningYellow elseif t_2[publish] then errorRed else unselectedGray
			end
			var2 = var2 or nil
		end
		if var1 then
			t_6 = v.subscribe
			
			if t_6 ~= nil then
				publish = if t[t_6] then hoverGreen elseif t_1[t_6] then warningYellow elseif t_2[t_6] then errorRed else unselectedGray
			end
			publish = publish or nil
		end
		t_6 = var1
		
		if t_6 then
			t_6 = if var2 ~= warningYellow then var2 == errorRed else true
			
			if not t_6 then
				t_6 = if publish ~= warningYellow then publish == errorRed else true
			end
		end
		local text = "row" .. i
		local createElement = roactModule.createElement
		local var3 = "Frame"
		local t_4 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			LayoutOrder = i
		}
		local t_5 = {
			Accent = var1 and (roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0, 2, 1, 0),
				BackgroundColor3 = constantsModule.Color.WarningYellow,
				BackgroundTransparency = if t_6 then 0 else 1
			}) or nil),
			Label = roactModule.createElement(cellLabelModule, {
				text = v.label,
				size = UDim2.new(uDim_3, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd
			})
		}
		local createElement_1 = roactModule.createElement
		local t_7 = {}
		local publish_1 = v.publish
		t_7.text = if publish_1 == nil or publish_1 == "" then "\226\128\148" else publish_1
		t_7.color = var2
		t_7.size = UDim2.new(uDim_4, UDim.new(1, 0))
		t_7.pos = UDim2.new(uDim_3, UDim.new(0, 0))
		t_5.Publish = createElement_1(LegCell, t_7)
		local createElement_2 = roactModule.createElement
		local var4 = LegCell
		local t_8 = {
			text = if publish_1 == nil or publish_1 == "" then "\226\128\148" else publish_1,
			color = publish,
			size = UDim2.new(uDim_4, UDim.new(1, 0)),
			pos = UDim2.new(uDim_3 + uDim_4, UDim.new(0, 0))
		}
		publish_1 = v.subscribe
		t_5.Subscribe = createElement_2(var4, t_8)
		t_3[text] = createElement(var3, t_4, t_5)
	end
	local rebootCount = connectivity.rebootCount and tostring(connectivity.rebootCount) or nil
	local createElement = roactModule.createElement
	local var5 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = #list + 1
	}
	local t_5 = {
		Label = roactModule.createElement(cellLabelModule, {
			text = "ICE restarts (this session)",
			size = UDim2.new(uDim_3, UDim.new(1, 0)),
			pos = UDim2.new(0, 0, 0, 0),
			textTruncate = Enum.TextTruncate.AtEnd
		})
	}
	t_6 = {
		text = if rebootCount == nil or rebootCount == "" then "\226\128\148" else rebootCount,
		size = UDim2.new(uDim_4, UDim.new(1, 0)),
		pos = UDim2.new(uDim_3, UDim.new(0, 0))
	}
	t_5.Publish = roactModule.createElement(LegCell, t_6)
	t_6 = {
		text = if rebootCount == nil or rebootCount == "" then "\226\128\148" else rebootCount,
		size = UDim2.new(uDim_4, UDim.new(1, 0)),
		pos = UDim2.new(uDim_3 + uDim_4, UDim.new(0, 0))
	}
	t_5.Subscribe = roactModule.createElement(LegCell, t_6)
	t_3.restartRow = createElement(var5, t_4, t_5)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Title = var1 and roactModule.createElement(GroupHeader, {
			title = "Transport state",
			subtitle = "publish / subscribe compared",
			layoutOrder = 1
		}) or roactModule.createElement(cellLabelModule, {
			text = "Transport state",
			bold = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		}),
		Header = roactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, if var1 then {
			Label = roactModule.createElement(cellLabelModule, {
				text = "",
				size = UDim2.new(uDim_3, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Publish = roactModule.createElement(HeaderCell, {
				text = "Publish",
				size = UDim2.new(uDim_4, UDim.new(1, 0)),
				pos = UDim2.new(uDim_3, UDim.new(0, 0))
			}),
			Subscribe = roactModule.createElement(HeaderCell, {
				text = "Subscribe",
				size = UDim2.new(uDim_4, UDim.new(1, 0)),
				pos = UDim2.new(uDim_3 + uDim_4, UDim.new(0, 0))
			})
		} else {
			Label = roactModule.createElement(cellLabelModule, {
				text = "",
				size = UDim2.new(uDim_3, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Publish = roactModule.createElement(cellLabelModule, {
				text = "PUBLISH",
				bold = true,
				size = UDim2.new(uDim_4, UDim.new(1, 0)),
				pos = UDim2.new(uDim_3, UDim.new(0, 0))
			}),
			Subscribe = roactModule.createElement(cellLabelModule, {
				text = "SUBSCRIBE",
				bold = true,
				size = UDim2.new(uDim_4, UDim.new(1, 0)),
				pos = UDim2.new(uDim_3 + uDim_4, UDim.new(0, 0))
			})
		}),
		Rows = roactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Rows = roactModule.createFragment(t_3)
		})
	})
end

local _ = function(p2)
	local sdpMLineIndex = p2.sdpMLineIndex
	
	return if sdpMLineIndex == nil then "\226\128\148" else tostring(sdpMLineIndex)
end

local _ = function(p2)
	return if p2 == nil or p2 == "" then "\226\128\148" else p2
end

local function TypePill(p2)
	-- upvalues: t_3 (ref), t_4 (ref), roactModule (ref), constantsModule (ref)
	local candidateType = p2.candidateType
	local var6 = if candidateType then t_3[candidateType] else t_4
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.size,
		Position = p2.pos
	}, {
		Pill = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 0, 0, 16),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = var6.background
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 7),
				PaddingRight = UDim.new(0, 7)
			}),
			Label = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = if candidateType == nil or candidateType == "" then "\226\128\148" else candidateType,
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.X,
				Font = constantsModule.Font.MainWindow,
				TextSize = constantsModule.DefaultFontSize.MainWindow - 2,
				TextColor3 = var6.text,
				TextXAlignment = Enum.TextXAlignment.Center
			})
		})
	})
end

local t_5 = {}

local _ = function(p2)
	-- upvalues: iceCandidateParserModule (ref), t_5 (ref)
	if not p2 then
		return iceCandidateParserModule(p2)
	end
	local var6 = t_5[p2]
	
	if var6 == nil then
		var6 = iceCandidateParserModule(p2)
		t_5[p2] = var6
	end
	return var6
end

local function CandidateTable(p2)
	-- upvalues: getFFlagVoiceDebugConsoleV2Module (ref), iceCandidateParserModule (ref), t_5 (ref), roactModule (ref), TypePill (ref), uDim_5 (ref), cellLabelModule (ref), uDim_6 (ref), uDim_7 (ref), uDim_8 (ref), uDim_9 (ref), uDim_10 (ref), uDim (ref), uDim_1 (ref), uDim_2 (ref), HeaderCell (ref), GroupHeader (ref)
	local title = p2.title
	local candidates = p2.candidates or {}
	local layoutOrder = p2.layoutOrder
	local var6 = getFFlagVoiceDebugConsoleV2Module()
	local t = {}
	
	for i, v in candidates do
		if not var6 then
			local text = "candidate" .. i
			local createElement = roactModule.createElement
			local var7 = "Frame"
			local t_1 = {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 20),
				LayoutOrder = i
			}
			local t_2 = {
				Candidate = roactModule.createElement(cellLabelModule, {
					text = v.candidate,
					size = UDim2.new(uDim, UDim.new(1, 0)),
					pos = UDim2.new(0, 0, 0, 0),
					textTruncate = Enum.TextTruncate.AtEnd
				}),
				SdpMid = roactModule.createElement(cellLabelModule, {
					text = v.sdpMid,
					size = UDim2.new(uDim_1, UDim.new(1, 0)),
					pos = UDim2.new(uDim, UDim.new(0, 0)),
					textTruncate = Enum.TextTruncate.AtEnd
				})
			}
			local createElement_1 = roactModule.createElement
			local var8 = cellLabelModule
			local t_3 = {}
			local sdpMLineIndex = v.sdpMLineIndex
			t_3.text = if sdpMLineIndex == nil then "\226\128\148" else tostring(sdpMLineIndex)
			t_3.size = UDim2.new(uDim_2, UDim.new(1, 0))
			t_3.pos = UDim2.new(uDim + uDim_1, UDim.new(0, 0))
			t_2.SdpMLineIndex = createElement_1(var8, t_3)
			t[text] = createElement(var7, t_1, t_2)
			continue
		end
		local var9
		local candidate = v.candidate
		
		if candidate then
			local var10 = t_5[candidate]
			
			if var10 == nil then
				var10 = iceCandidateParserModule(candidate)
				t_5[candidate] = var10
			end
			var9 = var10
		else
			var9 = iceCandidateParserModule(candidate)
		end
		local text = "candidate" .. i
		local createElement = roactModule.createElement
		local var11 = "Frame"
		local t_1 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			LayoutOrder = i
		}
		local t_2 = {
			Type = roactModule.createElement(TypePill, {
				candidateType = var9.candidateType,
				size = UDim2.new(uDim_5, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			})
		}
		local createElement_1 = roactModule.createElement
		local t_3 = {}
		local protocol = var9.protocol
		t_3.text = if protocol == nil or protocol == "" then "\226\128\148" else protocol
		t_3.size = UDim2.new(uDim_6, UDim.new(1, 0))
		t_3.pos = UDim2.new(uDim_5, UDim.new(0, 0))
		t_2.Proto = createElement_1(cellLabelModule, t_3)
		local createElement_2 = roactModule.createElement
		local t_4 = {
			text = if protocol == nil or protocol == "" then "\226\128\148" else protocol,
			size = UDim2.new(uDim_7, UDim.new(1, 0)),
			pos = UDim2.new(uDim_5 + uDim_6, UDim.new(0, 0))
		}
		protocol = var9.priority
		t_2.Priority = createElement_2(cellLabelModule, t_4)
		local createElement_3 = roactModule.createElement
		local t_6 = {
			text = if protocol == nil or protocol == "" then "\226\128\148" else protocol,
			size = UDim2.new(uDim_8, UDim.new(1, 0)),
			pos = UDim2.new(uDim_5 + uDim_6 + uDim_7, UDim.new(0, 0))
		}
		protocol = var9.component
		t_2.Comp = createElement_3(cellLabelModule, t_6)
		local createElement_4 = roactModule.createElement
		local t_7 = {
			text = if protocol == nil or protocol == "" then "\226\128\148" else protocol,
			size = UDim2.new(uDim_9, UDim.new(1, 0)),
			pos = UDim2.new(uDim_5 + uDim_6 + uDim_7 + uDim_8, UDim.new(0, 0)),
			textTruncate = Enum.TextTruncate.AtEnd
		}
		protocol = v.sdpMid
		t_2.Mid = createElement_4(cellLabelModule, t_7)
		local createElement_5 = roactModule.createElement
		local var12 = cellLabelModule
		local t_8 = {
			text = if protocol == nil then "\226\128\148" else tostring(protocol),
			size = UDim2.new(uDim_10, UDim.new(1, 0)),
			pos = UDim2.new(uDim_5 + uDim_6 + uDim_7 + uDim_8 + uDim_9, UDim.new(0, 0))
		}
		protocol = v.sdpMLineIndex
		t_2.Idx = createElement_5(var12, t_8)
		t[text] = createElement(var11, t_1, t_2)
	end
	if next(t) == nil then
		t.placeholder = roactModule.createElement(cellLabelModule, {
			text = "\226\128\148",
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Title = var6 and roactModule.createElement(GroupHeader, {
			layoutOrder = 1,
			title = title,
			subtitle = string.format("%d local", #candidates)
		}) or roactModule.createElement(cellLabelModule, {
			bold = true,
			layoutOrder = 1,
			text = title,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		}),
		Header = if var6 then roactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			Type = roactModule.createElement(HeaderCell, {
				text = "Type",
				size = UDim2.new(uDim_5, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Proto = roactModule.createElement(HeaderCell, {
				text = "Proto",
				size = UDim2.new(uDim_6, UDim.new(1, 0)),
				pos = UDim2.new(uDim_5, UDim.new(0, 0))
			}),
			Priority = roactModule.createElement(HeaderCell, {
				text = "Priority",
				size = UDim2.new(uDim_7, UDim.new(1, 0)),
				pos = UDim2.new(uDim_5 + uDim_6, UDim.new(0, 0))
			}),
			Comp = roactModule.createElement(HeaderCell, {
				text = "Comp",
				size = UDim2.new(uDim_8, UDim.new(1, 0)),
				pos = UDim2.new(uDim_5 + uDim_6 + uDim_7, UDim.new(0, 0))
			}),
			Mid = roactModule.createElement(HeaderCell, {
				text = "Mid",
				size = UDim2.new(uDim_9, UDim.new(1, 0)),
				pos = UDim2.new(uDim_5 + uDim_6 + uDim_7 + uDim_8, UDim.new(0, 0))
			}),
			Idx = roactModule.createElement(HeaderCell, {
				text = "Idx",
				size = UDim2.new(uDim_10, UDim.new(1, 0)),
				pos = UDim2.new(uDim_5 + uDim_6 + uDim_7 + uDim_8 + uDim_9, UDim.new(0, 0))
			})
		}) else roactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			Candidate = roactModule.createElement(cellLabelModule, {
				text = "CANDIDATE",
				bold = true,
				size = UDim2.new(uDim, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			SdpMid = roactModule.createElement(cellLabelModule, {
				text = "SDP MID",
				bold = true,
				size = UDim2.new(uDim_1, UDim.new(1, 0)),
				pos = UDim2.new(uDim, UDim.new(0, 0))
			}),
			SdpMLineIndex = roactModule.createElement(cellLabelModule, {
				text = "SDP MLINE INDEX",
				bold = true,
				size = UDim2.new(uDim_2, UDim.new(1, 0)),
				pos = UDim2.new(uDim + uDim_1, UDim.new(0, 0))
			})
		}),
		Rows = roactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Rows = roactModule.createFragment(t)
		})
	})
end

local _ = function(p3)
	return if p3 == nil then nil else string.gsub(string.gsub(p3, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}), "redacted", string.format("<font color=\"#%s\">redacted</font>", "6B6F75"))
end

local sdpSection = roactModule.PureComponent:extend("SdpSection")

function sdpSection.init(p3)
	p3.state = { expanded = false }
	
	function p13.onButtonPress()
		-- upvalues: p3 (ref)
		p3:setState(function(p4)
			return { expanded = not p4.expanded }
		end)
	end
end

function sdpSection.render(p3)
	-- upvalues: getFFlagVoiceDebugConsoleV2Module (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), constantsModule (ref)
	local var13
	local label = p3.props.label
	local sdp = p3.props.sdp
	local layoutOrder = p3.props.layoutOrder
	local var14 = getFFlagVoiceDebugConsoleV2Module()
	local var15 = sdp ~= nil and sdp ~= ""
	
	if var14 and var15 then
		var13 = (if sdp == nil then nil else string.gsub(string.gsub(sdp, "[<>&\"']", {
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;",
			["\""] = "&quot;",
			["'"] = "&apos;"
		}), "redacted", string.format("<font color=\"#%s\">redacted</font>", "6B6F75"))) or sdp
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Button = roactModule.createElement(bannerButtonModule, {
			hideLines = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			isExpanded = p3.state.expanded,
			isExpandable = var15,
			onButtonPress = if var15 then p3.onButtonPress else nil
		}, {
			Label = roactModule.createElement(cellLabelModule, {
				text = if var15 then label else string.format("%s: \226\128\148", label),
				size = UDim2.new(1, -20, 1, 0),
				pos = UDim2.new(0, 20, 0, 0)
			})
		}),
		Content = var15 and (p3.state.expanded and (roactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Text = var13,
			RichText = var14,
			TextSize = if var14 then constantsModule.DefaultFontSize.MainWindow - 3 else constantsModule.DefaultFontSize.MainWindow,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = constantsModule.Font.MainWindow,
			Size = UDim2.new(1, -20, 0, 0),
			Position = UDim2.new(0, 20, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}) or nil))
	})
end

return function(p3)
	-- upvalues: getFFlagVoiceDebugConsoleV2Module (ref), roactModule (ref), TransportStateTable (ref), CandidateTable (ref), GroupHeader (ref), sdpSection (ref), collapsibleSectionModule (ref), mainRowPadding (ref), cellLabelModule (ref)
	local connectivity = p3.connectivity or {}
	local layoutOrder = p3.layoutOrder
	local var13 = getFFlagVoiceDebugConsoleV2Module()
	local t = {
		TransportState = var13 and roactModule.createElement(TransportStateTable, { layoutOrder = 1, connectivity = connectivity }) or nil,
		PublishCandidates = roactModule.createElement(CandidateTable, {
			title = "Publish ICE candidates",
			layoutOrder = 2,
			candidates = connectivity.icePublishCandidates
		}),
		SubscribeCandidates = roactModule.createElement(CandidateTable, {
			title = "Subscribe ICE candidates",
			layoutOrder = 3,
			candidates = connectivity.iceSubscribeCandidates
		}),
		SessionDescriptionsHeader = var13 and roactModule.createElement(GroupHeader, {
			title = "Session descriptions",
			subtitle = "addresses redacted",
			layoutOrder = 4
		}) or nil,
		PublishOffer = roactModule.createElement(sdpSection, {
			label = "Publish offer",
			layoutOrder = 5,
			sdp = connectivity.sdpPublishOffer
		}),
		PublishRemoteAnswer = roactModule.createElement(sdpSection, {
			label = "Publish remote answer",
			layoutOrder = 6,
			sdp = connectivity.sdpPublishRemoteAnswer
		}),
		SubscribeRemoteOffer = roactModule.createElement(sdpSection, {
			label = "Subscribe remote offer",
			layoutOrder = 7,
			sdp = connectivity.sdpSubscribeRemoteOffer
		}),
		SubscribeAnswer = roactModule.createElement(sdpSection, {
			label = "Subscribe answer",
			layoutOrder = 8,
			sdp = connectivity.sdpSubscribeAnswer
		})
	}
	
	if var13 then
		return roactModule.createElement(collapsibleSectionModule, { title = "Connectivity", layoutOrder = layoutOrder }, t)
	end
	t.UIListLayout = roactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, mainRowPadding)
	})
	t.SectionHeader = roactModule.createElement(cellLabelModule, {
		text = "CONNECTIVITY",
		bold = true,
		layoutOrder = 0,
		size = UDim2.new(1, 0, 0, 20),
		pos = UDim2.new()
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder
	}, t)
end