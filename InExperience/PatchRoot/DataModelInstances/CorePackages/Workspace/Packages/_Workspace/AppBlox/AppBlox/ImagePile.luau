local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local logger = require(parent.Loggers).Logger
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local name = logger:new(script.Name)

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), cryoModule (ref), name (ref), imageSetLabel (ref)
	local tokens = useStyle().Tokens
	local var1 = cryoModule.Dictionary.union(reactModule.useMemo(function()
		-- upvalues: tokens (ref)
		return {
			imageBorderColor = tokens.Color.Extended.White.White_100.Color3,
			imageBorderThickness = tokens.Size.Size_50
		}
	end, { tokens }), p1)
	local var2 = reactModule.useMemo(function()
		-- upvalues: tokens (ref)
		return {
			[1] = {
				Attribute1 = {
					ZIndex = 1,
					AnchorPoint = Vector2.new(0, 0),
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromOffset(tokens.Size.Size_1000, tokens.Size.Size_1000)
				}
			},
			[2] = {
				Attribute1 = {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1),
					Size = UDim2.fromOffset(tokens.Size.Size_700, tokens.Size.Size_700)
				},
				Attribute2 = {
					ZIndex = 1,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.fromScale(1, 0),
					Size = UDim2.fromOffset(tokens.Size.Size_700, tokens.Size.Size_700)
				}
			}
		}
	end, { tokens })
	local var3 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref)
		return var2[math.min(p2, 2)]["Attribute" .. p2]
	end, { var2 })
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), name (copy), var3 (ref), reactModule (copy), imageSetLabel (copy)
		local t = {}
		
		for i, v in var1.images do
			if i <= 2 then
				local var5 = var3(#var1.images, i)
				v.AnchorPoint = var5.AnchorPoint
				v.Position = var5.Position
				v.Size = var5.Size
				v.ZIndex = var5.ZIndex
				t[tostring(i)] = reactModule.createElement(imageSetLabel, v, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					UIStroke = reactModule.createElement("UIStroke", {
						Transparency = 0,
						Color = var1.imageBorderColor,
						Thickness = var1.imageBorderThickness
					})
				})
				continue
			end
			name:warning("More than 2 images provided but only the first 2 will be shown.")
			
			return t
		end
		return t
	end, { var1.images })
	
	if #var1.images == 0 then
		name:warning("Cannot have empty list of images")
		
		return nil
	end
	return reactModule.createElement("Frame", {
		[reactModule.Tag] = "data-testid=ImagePile",
		BackgroundTransparency = 1,
		Name = "ImagePile",
		Size = UDim2.fromOffset(tokens.Size.Size_1000, tokens.Size.Size_1000)
	}, var4)
end