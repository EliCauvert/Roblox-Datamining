local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLayoutValues = playerListModule.Common.useLayoutValues
local useStyle = UIBloxModule.Core.Style.useStyle
local entryFrameView = playerListModule.Presentation.EntryFrameView
local statEntryContainerModule = require(parent_1.Components.Container.StatEntryContainer)
local fFlagPlayerListFixLeaderstatsStacking = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local cellExtenderModule = require(parent.Presentation.CellExtender)

return reactModule.memo(function(p0)
	-- upvalues: useLayoutValues (ref), useStyle (ref), fFlagEnableMobilePlayerListOnConsole (ref), reactModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), statEntryContainerModule (ref), entryFrameView (ref), cellExtenderModule (ref)
	local var7 = useLayoutValues()
	local var8 = useStyle()
	local isSmallTouchDevice = p0.isSmallTouchDevice or false
	local isDirectionalPreferred = p0.isDirectionalPreferred or false
	local textEmphasis = var8.Theme.TextEmphasis
	local var11 = if fFlagEnableMobilePlayerListOnConsole then var7.TeamNameTextSize else var8.Font.CaptionHeader.RelativeSize * var8.Font.BaseSize
	local font = var8.Font.CaptionHeader.Font
	
	if isDirectionalPreferred then
		textEmphasis = var7.DefaultTextStyle
		var11 = var7.PlayerNameTextSize
		font = var7.TeamEntryFont
	end
	local var12 = reactModule.useMemo(function()
		-- upvalues: isSmallTouchDevice (ref), var8 (ref), p0 (ref), isDirectionalPreferred (ref), var7 (ref)
		return if isSmallTouchDevice then {
			Color = p0.teamColor,
			Transparency = var8.Settings.PreferredTransparency * 0.5
		} elseif isDirectionalPreferred then {
			Color = p0.teamColor,
			Transparency = if var7.BackgroundStyle then var7.BackgroundStyle.Default.Transparency else 0
		} else {
			Color = p0.teamColor,
			Transparency = var7.TeamEntryBackgroundTransparency * var8.Settings.PreferredTransparency
		}
	end, {
		isSmallTouchDevice,
		isDirectionalPreferred,
		p0.teamColor,
		var8,
		var7
	})
	local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
	local maxLeaderstats = var7.MaxLeaderstats
	local var14 = if fFlagPlayerListFixLeaderstatsStacking then signalsReactModule.useSignalState(p0.gameStats.getAllData) else nil
	
	if isSmallTouchDevice then
		local t_1 = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			NameFrame = reactModule.createElement("TextLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var7.PlayerNameSizeXMobile, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = font,
				TextSize = var11,
				TextColor3 = textEmphasis.Color,
				TextStrokeTransparency = textEmphasis.StrokeTransparency,
				TextStrokeColor3 = textEmphasis.StrokeColor,
				Text = p0.teamName,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var7.TeamEntryTextPaddingMobile)
				})
			})
		}
		
		if fFlagPlayerListFixLeaderstatsStacking then
			for i, v in var14 do
				if maxLeaderstats >= v.order(false) then
					t_1["GameStat_" .. i] = reactModule.createElement(statEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						statName = i,
						stat = p0.teamStats.getData(i, false),
						textStyle = textEmphasis
					})
				end
			end
		elseif p0.gameStatsCount and p0.teamStatsCount and (p0.gameStatsCount > 0 and p0.teamStatsCount >= 0) then
			p0.gameStats.iterateData(function(p1, p2)
				-- upvalues: maxLeaderstats (ref), p0 (ref), t_1 (ref), reactModule (copy), statEntryContainerModule (copy), textEmphasis (write)
				if maxLeaderstats < p2.order(false) then
					return
				end
				t_1["GameStat_" .. p1] = reactModule.createElement(statEntryContainerModule, {
					isTeamEntry = true,
					showStatTitle = false,
					statName = p1,
					stat = p0.teamStats.getData(p1, false),
					textStyle = textEmphasis
				})
			end, false)
		end
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			GroupTransparency = nil,
			LayoutOrder = p0.layoutOrder,
			Size = p0.size,
			BackgroundColor3 = var12.Color,
			BackgroundTransparency = var12.Transparency
		}, t_1)
	else
		local t_1 = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = if isDirectionalPreferred then UDim.new(0, var7.PlayerEntryPadding) else nil
			}),
			NameFrame = reactModule.createElement("Frame", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p0.entrySizeX, 0, var7.TeamEntrySizeY)
			}, {
				Shadow = reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = var7.ShadowImage,
					Position = UDim2.new(0, -var7.ShadowSize, 0, 0),
					Size = UDim2.new(1, var7.ShadowSize * 2, 1, var7.ShadowSize),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = var7.ShadowSliceRect,
					Visible = isDirectionalPreferred
				}),
				BGFrame = reactModule.createElement(entryFrameView, {
					isTeamFrame = true,
					doubleOverlay = false,
					size = UDim2.new(0, p0.entrySizeX, 0, var7.TeamEntrySizeY),
					backgroundStyle = var12,
					overlayStyle = t
				}, {
					TeamName = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(1, 0, 1, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						Font = font,
						TextSize = var11,
						TextColor3 = textEmphasis.Color,
						TextStrokeTransparency = textEmphasis.StrokeTransparency,
						TextStrokeColor3 = textEmphasis.StrokeColor,
						Text = p0.teamName,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var7.TeamEntryTextPadding) })
					})
				})
			})
		}
		
		if fFlagPlayerListFixLeaderstatsStacking then
			for i, v in var14 do
				if maxLeaderstats >= v.order(false) then
					t_1["GameStat_" .. i] = reactModule.createElement(statEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						doubleOverlay = false,
						statName = i,
						stat = p0.teamStats.getData(i, false),
						backgroundStyle = var12,
						overlayStyle = t,
						textStyle = textEmphasis
					})
				end
			end
		elseif p0.gameStatsCount and p0.teamStatsCount and (p0.gameStatsCount > 0 and p0.teamStatsCount >= 0) then
			p0.gameStats.iterateData(function(p3, p4)
				-- upvalues: maxLeaderstats (ref), p0 (ref), t_1 (ref), reactModule (copy), statEntryContainerModule (copy), var12 (ref), t (ref), textEmphasis (write)
				if maxLeaderstats < p4.order(false) then
					return
				end
				t_1["GameStat_" .. p3] = reactModule.createElement(statEntryContainerModule, {
					isTeamEntry = true,
					showStatTitle = false,
					doubleOverlay = false,
					statName = p3,
					stat = p0.teamStats.getData(p3, false),
					backgroundStyle = var12,
					overlayStyle = t,
					textStyle = textEmphasis
				})
			end, false)
		end
		if not isDirectionalPreferred then
			t_1.BackgroundExtender = reactModule.createElement(cellExtenderModule, {
				layoutOrder = 100,
				doubleOverlay = false,
				size = UDim2.new(0, var7.ExtraContainerPadding, 1, 0),
				backgroundStyle = var12,
				overlayStyle = t
			})
		end
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = nil,
			Size = p0.size,
			BackgroundColor3 = Color3.new(1, 1, 1),
			LayoutOrder = p0.layoutOrder
		}, t_1)
	end
end)