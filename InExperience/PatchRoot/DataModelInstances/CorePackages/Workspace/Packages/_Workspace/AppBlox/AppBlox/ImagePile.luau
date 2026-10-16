local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local NewResult = require(Parent.Loggers).Logger:new(script.Name)

return function(p1) --[[ Line: 22 | Named "ImagePile" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), CryoModule (copy), NewResult (copy), ImageSetLabel (copy)
	local Tokens = UseStyleFunction().Tokens
	local UnionResult = CryoModule.Dictionary.union(ReactModule.useMemo(function() --[[ Line: 26 ]]
		-- upvalues: Tokens (copy)
		return {
			imageBorderColor = Tokens.Color.Extended.White.White_100.Color3,
			imageBorderThickness = Tokens.Size.Size_50
		}
	end, { Tokens }), p1)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: Tokens (copy)
		return {
			[1] = {
				Attribute1 = {
					ZIndex = 1,
					AnchorPoint = Vector2.new(0, 0),
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromOffset(Tokens.Size.Size_1000, Tokens.Size.Size_1000)
				}
			},
			[2] = {
				Attribute1 = {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1),
					Size = UDim2.fromOffset(Tokens.Size.Size_700, Tokens.Size.Size_700)
				},
				Attribute2 = {
					ZIndex = 1,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.fromScale(1, 0),
					Size = UDim2.fromOffset(Tokens.Size.Size_700, Tokens.Size.Size_700)
				}
			}
		}
	end, { Tokens })
	local UseResult = ReactModule.useCallback(function(p2: number, Text) --[[ Line: 62 ]]
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult[math.min(p2, 2)]["Attribute" .. Text]
	end, { UseMemoResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 67 ]]
		-- upvalues: UnionResult (copy), NewResult (upval), UseResult (copy), ReactModule (upval), ImageSetLabel (upval)
		local Elements = {}
		
		for i, image in UnionResult.images do
			if i > 2 then
				NewResult:warning("More than 2 images provided but only the first 2 will be shown.")
				
				return Elements
			end
			local UseResultResult = UseResult(#UnionResult.images, i)
			image.AnchorPoint = UseResultResult.AnchorPoint
			image.Position = UseResultResult.Position
			image.Size = UseResultResult.Size
			image.ZIndex = UseResultResult.ZIndex
			Elements[tostring(i)] = ReactModule.createElement(ImageSetLabel, image, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				UIStroke = ReactModule.createElement("UIStroke", {
					Transparency = 0,
					Color = UnionResult.imageBorderColor,
					Thickness = UnionResult.imageBorderThickness
				})
			})
		end
		return Elements
	end, { UnionResult.images })
	
	if #UnionResult.images == 0 then
		NewResult:warning("Cannot have empty list of images")
		
		return nil
	else
		return ReactModule.createElement("Frame", {
			[ReactModule.Tag] = "data-testid=ImagePile",
			BackgroundTransparency = 1,
			Name = "ImagePile",
			Size = UDim2.fromOffset(Tokens.Size.Size_1000, Tokens.Size.Size_1000)
		}, UseMemoResult1)
	end
end