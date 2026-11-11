local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RoactModule = require(CorePackages.Packages.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactLocalization)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ExperienceGuidelinesList = RoactModule.PureComponent:extend("ExperienceGuidelinesList")
ExperienceGuidelinesList.validateProps = TModule.strictInterface({
	ageRecommendations = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails.validateModel,
	localization = TModule.table,
	layoutOrder = TModule.optional(TModule.number)
})

function ExperienceGuidelinesList.init(p1)
	-- upvalues: RoactModule (copy), StyledTextLabel (copy), MemoizeFunction (copy)
	function p1.createDescriptorLabels(p2, List)
		-- upvalues: RoactModule (upval), StyledTextLabel (upval)
		local Elements = {}
		
		for i, value in ipairs(List) do
			Elements["Descriptor" .. i] = RoactModule.createElement(StyledTextLabel, {
				fluidSizing = false,
				layoutOrder = i + 1,
				fontStyle = p2.Font.Body,
				colorStyle = p2.Theme.TextDefault,
				size = UDim2.new(1, 0, 0, 0),
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.Y,
				text = value.displayName
			})
		end
		return Elements
	end
	
	function p1.createContentList(p3, Descriptors)
		-- upvalues: RoactModule (upval), p1 (copy)
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 8)
			})
		}
		
		for i, value in pairs((p1.createDescriptorLabels(p3, Descriptors))) do
			config[i] = value
		end
		return config
	end
	
	p1.createDescriptors = MemoizeFunction(function(p4)
		local t = {}
		local DescriptorUsages = p4.descriptorUsages
		
		if DescriptorUsages ~= nil then
			for i, descriptorUsage in ipairs(DescriptorUsages) do
				local Descriptor = descriptorUsage.descriptor
				
				if Descriptor then
					t[i] = { displayName = Descriptor.displayName }
				end
			end
		end
		return t
	end)
end

function ExperienceGuidelinesList.render(p4)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), StyledTextLabel (copy)
	local Localization = p4.props.localization
	local AgeRecommendations = p4.props.ageRecommendations
	local Descriptors = nil
	local DisplayName = nil
	
	if AgeRecommendations then
		Descriptors = p4.createDescriptors(AgeRecommendations)
		local AgeRecommendation = AgeRecommendations.summary.ageRecommendation
		DisplayName = if AgeRecommendation then AgeRecommendation.displayName else Localization:Format("Feature.GameDetails.Label.Unavailable")
	else
		Descriptors = {}
		DisplayName = Localization:Format("Feature.GameDetails.Label.Unavailable")
	end
	return WithStyleFunction(function(p5)
		-- upvalues: p4 (copy), Descriptors (ref), RoactModule (upval), StyledTextLabel (upval), DisplayName (ref)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p4.props.layoutOrder,
			BackgroundColor3 = p5.Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			MainLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 24)
			}),
			SummaryLabel = RoactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				fluidSizing = false,
				fontStyle = p5.Font.Title,
				colorStyle = p5.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.Y,
				text = DisplayName
			}),
			ListFrame = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BorderSizePixel = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromOffset(0, 0)
			}, (p4.createContentList(p5, Descriptors)))
		})
	end)
end

return (RoactServices.connect({ localization = RoactLocalizationModule })(ExperienceGuidelinesList))