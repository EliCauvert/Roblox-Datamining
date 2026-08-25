local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local logger = require(parent.Loggers).Logger
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local name = logger:new(script.Name)

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), cryoModule (ref), name (ref), imageSetLabel (ref)
	local tokens = useStyle().Tokens
	local var4 = cryoModule.Dictionary.union(reactModule.useMemo(function()
		-- upvalues: tokens (ref)
		return {
			imageBorderColor = tokens.Color.Extended.White.White_100.Color3,
			imageBorderThickness = tokens.Size.Size_50
		}
	end, { tokens }), p0)
	local var5 = reactModule.useMemo(function()
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
	local var6 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var5 (ref)
		return var5[math.min(p1, 2)]["Attribute" .. p2]
	end, { var5 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), name (copy), var6 (ref), reactModule (copy), imageSetLabel (copy)
		local t = {}
		
		for i, v in var4.images do
			if i <= 2 then
				local var9 = var6(#var4.images, i)
				v.AnchorPoint = var9.AnchorPoint
				v.Position = var9.Position
				v.Size = var9.Size
				v.ZIndex = var9.ZIndex
				t[tostring(i)] = reactModule.createElement(imageSetLabel, v, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					UIStroke = reactModule.createElement("UIStroke", {
						Transparency = 0,
						Color = var4.imageBorderColor,
						Thickness = var4.imageBorderThickness
					})
				})
				continue
			end
			name:warning("More than 2 images provided but only the first 2 will be shown.")
			
			return t
		end
		return t
	end, { var4.images })
	
	if #var4.images == 0 then
		name:warning("Cannot have empty list of images")
		
		return nil
	end
	return reactModule.createElement("Frame", {
		[reactModule.Tag] = "data-testid=ImagePile",
		BackgroundTransparency = 1,
		Name = "ImagePile",
		Size = UDim2.fromOffset(tokens.Size.Size_1000, tokens.Size.Size_1000)
	}, var7)
end