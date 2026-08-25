local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryAudioPlayerContainerModule = require(script.Parent.Parent.AssetLibraryAudioPlayer.AssetLibraryAudioPlayerContainer)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local image = foundationModule.Image
local iconButton = foundationModule.IconButton
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius

local function getAttribution(p0)
	local t = {}
	
	if p0.creatorName ~= nil and p0.creatorName ~= "" then
		table.insert(t, p0.creatorName)
	end
	if p0.createTime ~= nil and p0.createTime ~= "" then
		table.insert(t, p0.createTime)
	end
	return if #t == 0 then nil else table.concat(t, " \194\183 ")
end

return function(value)
	-- upvalues: reactModule (ref), view (ref), image (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), skeleton (ref), radius (ref), getAttribution (ref), assetLibraryAudioPlayerContainerModule (ref), overflowMenuPageShellModule (ref)
	local asset = value.asset
	local var7 = if asset == nil or asset.assetType ~= "Audio" then "" else asset.displayName
	local var8 = nil
	
	if value.status == "Ready" and asset ~= nil and asset.assetType ~= "Audio" then
		local createElement_1
		local assetId = `rbxthumb://type=Asset&id={asset.assetId}&w=420&h=420`
		local createElement = reactModule.createElement
		local var10 = view
		local t = { tag = "size-full clip", testId = "AssetLibrary.Preview" }
		local t_1 = {
			Media = reactModule.createElement(image, {
				testId = "AssetLibrary.Preview.Media",
				Image = assetId,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromScale(1, 1)
			}),
			Header = reactModule.createElement(view, {
				ZIndex = 2,
				testId = "AssetLibrary.Preview-header",
				tag = {
					["composition-content-header"] = true,
					["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
				}
			}, {
				Back = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "AssetLibrary.Preview-close",
					icon = iconName.ChevronLargeLeft,
					onActivated = value.onBack,
					size = inputSize.Medium,
					variant = buttonVariant.Utility
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
					testId = "AssetLibrary.Preview-title",
					Text = asset.displayName
				})
			})
		}
		
		if (asset.description == nil or asset.description == "") and asset.updateTime == nil then
			createElement_1 = nil
		else
			createElement_1 = reactModule.createElement
			createElement_1 = createElement_1(view, {
				ZIndex = 2,
				tag = "col gap-small anchor-bottom-left auto-y",
				testId = "AssetLibrary.Preview.SupportingContent",
				Position = UDim2.new(0, 20, 1, -20),
				Size = UDim2.new(1, -40, 0, 0)
			}, {
				Description = if asset.description == nil or asset.description == "" then nil else reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = asset.description
				}),
				Updated = if asset.updateTime ~= nil then nil else reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-caption-small text-align-x-left content-muted",
					testId = "AssetLibrary.Preview.Updated",
					Text = `{value.strings.updated} {asset.updateTime}`
				})
			})
		end
		t_1.SupportingContent = createElement_1
		
		return createElement(var10, t, t_1)
	elseif value.status == "Loading" or value.status == "NotReady" then
		var8 = reactModule.createElement(view, {
			tag = "col align-x-center gap-large size-full-0 auto-y padding-y-xlarge",
			testId = "AssetLibrary.Preview.Skeleton"
		}, {
			Preview = reactModule.createElement(view, {
				LayoutOrder = 1,
				testId = "AssetLibrary.Preview.Container",
				Size = UDim2.fromScale(1, 1),
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Width
				},
				sizeConstraint = { MaxSize = Vector2.new(320, 320) }
			}, {
				Skeleton = reactModule.createElement(skeleton, { radius = radius.Medium, Size = UDim2.fromScale(1, 1) })
			}),
			Info = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col align-x-center gap-small size-full-0 auto-y"
			}, {
				Title = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.6, 0, 0, 20),
					radius = radius.Small
				}),
				Subtitle = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.4, 0, 0, 20),
					radius = radius.Small
				})
			})
		})
	elseif value.status == "Failed" or asset == nil then
		var8 = reactModule.createElement(text, {
			tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default",
			Text = value.strings.assetUnavailable
		})
	else
		local var13 = getAttribution(asset)
		
		if asset.assetType == "Audio" then
			local createElement_2
			local createElement = reactModule.createElement
			local var14 = view
			local t = { tag = "col size-full" }
			local t_1 = {
				PlayerRegion = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col align-x-center align-y-center fill size-full-0 padding-bottom-xlarge"
				}, {
					Player = reactModule.createElement(assetLibraryAudioPlayerContainerModule, {
						thumbnail = nil,
						assetId = asset.assetId,
						title = asset.displayName,
						artist = asset.creatorName or asset.displayType
					})
				})
			}
			
			if asset.description == nil and var13 == nil then
				createElement_2 = nil
			else
				createElement_2 = reactModule.createElement
				createElement_2 = createElement_2(view, {
					LayoutOrder = 2,
					tag = "col gap-medium size-full-0 auto-y padding-bottom-medium",
					testId = "AssetLibrary.Preview.SupportingContent"
				}, {
					Description = if asset.description == nil or asset.description == "" then nil else reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
						Text = asset.description
					}),
					Attribution = if var13 ~= nil then nil else reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-muted",
						Text = var13
					})
				})
			end
			t_1.SupportingContent = createElement_2
			var8 = createElement(var14, t, t_1)
		else
			error("Non-audio ready assets render through the immersive preview")
		end
	end
	return reactModule.createElement(overflowMenuPageShellModule, {
		testId = "AssetLibrary.Preview",
		title = var7,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = value.onBack,
		disableScrolling = value.status == "Ready",
		content = var8
	})
end