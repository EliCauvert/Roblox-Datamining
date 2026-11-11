local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local FFlagMinMaxPriceValidation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagMinMaxPriceValidation
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local FilterTextBoxModule = require(script.Parent.FilterTextBox)

local function _(p1, Text)
	-- upvalues: MutedErrorModule (copy)
	if p1 and p1.current then
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), Text (copy)
			if p1.current.Text ~= Text then
				p1.current.Text = Text
			end
		end)
		
		if not Success then
			MutedErrorModule("[PriceRangeInput] Failed to update text to " .. Text .. " with error " .. tostring(Result))
		end
	end
end

local config = {
	minPrice = CatalogConstantsModule.MinPriceFilter,
	maxPrice = CatalogConstantsModule.MaxPriceFilter
}

return function(p1)
	-- upvalues: DashModule (copy), config (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagMinMaxPriceValidation (copy), CatalogConstantsModule (copy), MutedErrorModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FilterTextBoxModule (copy), StyledTextLabel (copy)
	local JoinResult = DashModule.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local Common = UseStyleResult.Tokens.Semantic.Color.Common
	local UseLocalizationResult = UseLocalizationFunction({
		min = "Feature.Catalog.Label.Filter.PriceMin",
		max = "Feature.Catalog.Label.Filter.PriceMax"
	})
	local _UDim = UDim.new(0.5, -13)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if FFlagMinMaxPriceValidation then
		local UseStateResult, UseStateResult2 = ReactModule.useState(true)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), CatalogConstantsModule (upval), UseStateResult2 (copy)
			if UseRefResult.current and UseRefResult1.current and (tonumber(UseRefResult1.current.text) or CatalogConstantsModule.MaxPriceFilter) < (tonumber(UseRefResult.current.text) or CatalogConstantsModule.MinPriceFilter) then
				return UseStateResult2(false)
			else
				return UseStateResult2(true)
			end
		end, {})
		
		return (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -12 - (if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50) * 2, 0, 30 + (if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50) * 2)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
				PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50)
			}),
			MenuLayoutFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
					PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
					PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
					PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Corner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, (if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50) * 100)
				}),
				Border = ReactModule.createElement("UIStroke", {
					Thickness = 2,
					Color = Common.Alert.Color3,
					Transparency = if UseStateResult then 1 else Common.Alert.Transparency,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				}),
				MinPriceTextBox = ReactModule.createElement(FilterTextBoxModule, {
					layoutOrder = 1,
					text = if CatalogConstantsModule.MinPriceFilter < JoinResult.minPrice then tostring(JoinResult.minPrice) else "",
					placeholderText = UseLocalizationResult.min,
					onTextChanged = ReactModule.useCallback(function(Text: string)
						-- upvalues: JoinResult (copy), CatalogConstantsModule (upval), UseRefResult (copy), MutedErrorModule (upval), UseResult (copy)
						if JoinResult.setMinPrice then
							local Number: number? = tonumber((Text:gsub("%D", "")))
							local Number1: number = Number or CatalogConstantsModule.MinPriceFilter
							JoinResult.setMinPrice(Number1)
							local Text1: string = if Number then tostring(Number1) else ""
							
							if UseRefResult and UseRefResult.current then
								local Success, Result = pcall(function()
									-- upvalues: UseRefResult (copy), Text1 (copy)
									if UseRefResult.current.Text ~= Text1 then
										UseRefResult.current.Text = Text1
									end
								end)
								
								if not Success then
									MutedErrorModule("[PriceRangeInput] Failed to update text to " .. Text1 .. " with error " .. tostring(Result))
								end
							end
						end
						UseResult()
					end, { JoinResult.setMinPrice, UseResult }),
					onFocused = JoinResult.onFocused,
					width = _UDim,
					textBoxRef = UseRefResult,
					NextSelectionRight = UseRefResult1
				}),
				Dash = ReactModule.createElement(StyledTextLabel, {
					text = "–",
					layoutOrder = 2,
					size = UDim2.fromOffset(26, 30),
					colorStyle = {
						Color = Theme.TextEmphasis.Color,
						Transparency = Theme.TextEmphasis.Transparency
					},
					fontStyle = UseStyleResultFont.Header2,
					textXAlignment = Enum.TextXAlignment.Center
				}),
				MaxPriceTextBox = ReactModule.createElement(FilterTextBoxModule, {
					layoutOrder = 3,
					text = if JoinResult.maxPrice < CatalogConstantsModule.MaxPriceFilter then tostring(JoinResult.maxPrice) else "",
					placeholderText = UseLocalizationResult.max,
					onTextChanged = ReactModule.useCallback(function(Text: string)
						-- upvalues: JoinResult (copy), CatalogConstantsModule (upval), UseRefResult1 (copy), MutedErrorModule (upval), UseResult (copy)
						if JoinResult.setMaxPrice then
							local Number: number? = tonumber((Text:gsub("%D", "")))
							local Number1: number = Number or CatalogConstantsModule.MaxPriceFilter
							JoinResult.setMaxPrice(Number1)
							local Text1: string = if Number then tostring(Number1) else ""
							
							if UseRefResult1 and UseRefResult1.current then
								local Success, Result = pcall(function()
									-- upvalues: UseRefResult1 (copy), Text1 (copy)
									if UseRefResult1.current.Text ~= Text1 then
										UseRefResult1.current.Text = Text1
									end
								end)
								
								if not Success then
									MutedErrorModule("[PriceRangeInput] Failed to update text to " .. Text1 .. " with error " .. tostring(Result))
								end
							end
						end
						UseResult()
					end, { JoinResult.setMaxPrice, UseResult }),
					onFocused = JoinResult.onFocused,
					width = _UDim,
					textBoxRef = UseRefResult1,
					NextSelectionLeft = UseRefResult
				})
			})
		}))
	else
		return (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, -12, 0, 30)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			MinPriceTextBox = ReactModule.createElement(FilterTextBoxModule, {
				layoutOrder = 1,
				text = if CatalogConstantsModule.MinPriceFilter < JoinResult.minPrice then tostring(JoinResult.minPrice) else "",
				placeholderText = UseLocalizationResult.min,
				onTextChanged = ReactModule.useCallback(function(Text: string)
					-- upvalues: JoinResult (copy), CatalogConstantsModule (upval), UseRefResult (copy), MutedErrorModule (upval)
					if JoinResult.setMinPrice then
						local Number: number? = tonumber((Text:gsub("%D", "")))
						local Number1: number = Number or CatalogConstantsModule.MinPriceFilter
						JoinResult.setMinPrice(Number1)
						local Text1: string = if Number then tostring(Number1) else ""
						
						if UseRefResult and UseRefResult.current then
							local Success, Result = pcall(function()
								-- upvalues: UseRefResult (copy), Text1 (copy)
								if UseRefResult.current.Text ~= Text1 then
									UseRefResult.current.Text = Text1
								end
							end)
							
							if not Success then
								MutedErrorModule("[PriceRangeInput] Failed to update text to " .. Text1 .. " with error " .. tostring(Result))
							end
						end
					end
				end, { JoinResult.setMinPrice }),
				onFocused = JoinResult.onFocused,
				width = _UDim,
				textBoxRef = UseRefResult,
				NextSelectionRight = UseRefResult1
			}),
			Dash = ReactModule.createElement(StyledTextLabel, {
				text = "–",
				layoutOrder = 2,
				size = UDim2.fromOffset(26, 30),
				colorStyle = {
					Color = Theme.TextEmphasis.Color,
					Transparency = Theme.TextEmphasis.Transparency
				},
				fontStyle = UseStyleResultFont.Header2,
				textXAlignment = Enum.TextXAlignment.Center
			}),
			MaxPriceTextBox = ReactModule.createElement(FilterTextBoxModule, {
				layoutOrder = 3,
				text = if JoinResult.maxPrice < CatalogConstantsModule.MaxPriceFilter then tostring(JoinResult.maxPrice) else "",
				placeholderText = UseLocalizationResult.max,
				onTextChanged = ReactModule.useCallback(function(Text: string)
					-- upvalues: JoinResult (copy), CatalogConstantsModule (upval), UseRefResult1 (copy), MutedErrorModule (upval)
					if JoinResult.setMaxPrice then
						local Number: number? = tonumber((Text:gsub("%D", "")))
						local Number1: number = Number or CatalogConstantsModule.MaxPriceFilter
						JoinResult.setMaxPrice(Number1)
						local Text1: string = if Number then tostring(Number1) else ""
						
						if UseRefResult1 and UseRefResult1.current then
							local Success, Result = pcall(function()
								-- upvalues: UseRefResult1 (copy), Text1 (copy)
								if UseRefResult1.current.Text ~= Text1 then
									UseRefResult1.current.Text = Text1
								end
							end)
							
							if not Success then
								MutedErrorModule("[PriceRangeInput] Failed to update text to " .. Text1 .. " with error " .. tostring(Result))
							end
						end
					end
				end, { JoinResult.setMaxPrice }),
				onFocused = JoinResult.onFocused,
				width = _UDim,
				textBoxRef = UseRefResult1,
				NextSelectionLeft = UseRefResult
			})
		}))
	end
end