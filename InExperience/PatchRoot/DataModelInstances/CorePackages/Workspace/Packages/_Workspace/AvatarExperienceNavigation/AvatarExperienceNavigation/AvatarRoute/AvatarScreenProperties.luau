local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local parent = avatarExperienceNavigation.Parent
local avatarScreenModule = require(avatarExperienceNavigation.Enums.AvatarScreen)
local unifiedLoggingSurfaceModule = require(avatarExperienceNavigation.Enums.UnifiedLoggingSurface)
local cryoModule = require(parent.Cryo)
local _ = require(parent.Dash)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXEditorSubcategoryFilters = avatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXEnableExpiredUserLookCheckout = avatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local fFlagAXFixGamepadNavigationOnOutfitManagement = avatarExperienceFlagsModule.FFlagAXFixGamepadNavigationOnOutfitManagement
local fFlagAXOutfitPageRevamp = avatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local fFlagAXAvatarFoldersEnabled = avatarExperienceFlagsModule.FFlagAXAvatarFoldersEnabled
local AXEnableMultiTryOnUI = game:DefineFastFlag("AXEnableMultiTryOnUI", false)
local AXKeepTryOnsInAvatarEditor = game:DefineFastFlag("AXKeepTryOnsInAvatarEditor", false)
local fFlagAXFixAvatarScreenVR = avatarExperienceFlagsModule.FFlagAXFixAvatarScreenVR
local fFlagAXMakeupReleaseFTUX = avatarExperienceFlagsModule.FFlagAXMakeupReleaseFTUX
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagEditProfileImageV2Enabled2 = require(parent.SharedFlags).FFlagEditProfileImageV2Enabled2
local t = {
	isTransparent = false,
	coversSceneWhenExpanded = false,
	isTryOnOutfitResetPage = false,
	isRefinementPage = false,
	refinementButtonVisible = false,
	VRPanelRoundedCorners = false,
	VRPanelPlacement = "Center",
	isMultiTryOn = if fFlagAXMISEnableMultiShopping then nil else false
}
local t_1 = {
	[avatarScreenModule.AccessoryAdjustment] = {
		isRefinementPage = true,
		isMultiTryOn = if fFlagAXMISEnableMultiShopping then nil else AXEnableMultiTryOnUI,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.AvatarExperienceLandingPage] = { isTryOnOutfitResetPage = true },
	[avatarScreenModule.AvatarExperienceRoot] = {},
	[avatarScreenModule.AvatarBackground] = { isTransparent = false },
	[avatarScreenModule.Catalog] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isMultiTryOn = if fFlagAXMISEnableMultiShopping then nil else AXEnableMultiTryOnUI,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CATALOG
		}
	},
	[avatarScreenModule.CatalogContextMenu] = { VRPanelPlacement = "Right" },
	[avatarScreenModule.CatalogSearch] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isMultiTryOn = if fFlagAXMISEnableMultiShopping then nil else AXEnableMultiTryOnUI,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.SEARCH_RESULTS
		}
	},
	[avatarScreenModule.CatalogSearchLanding] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isMultiTryOn = if fFlagAXMISEnableMultiShopping then nil else AXEnableMultiTryOnUI,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.SEARCH_LANDING_PAGE
		}
	},
	[avatarScreenModule.ItemDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.OutfitDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.ItemOwnershipPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.CreateOrUpdateOutfitMenu] = { VRPanelPlacement = "Left" },
	[avatarScreenModule.LayeredClothingSort] = {
		isRefinementPage = true,
		VRPanelPlacement = "Center",
		isMultiTryOn = if fFlagAXMISEnableMultiShopping then nil else AXEnableMultiTryOnUI,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.LCSortContextMenu] = { VRPanelPlacement = "Right" },
	[avatarScreenModule.AvatarEditor] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isTryOnOutfitResetPage = if AXKeepTryOnsInAvatarEditor then false else true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.AvatarRefinement] = {
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.ManageOutfitPage] = {
		isTransparent = if fFlagAXFixGamepadNavigationOnOutfitManagement then false else true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.ProfilePictureEditorEmotes] = { isTryOnOutfitResetPage = true },
	[avatarScreenModule.ResellersPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.SellItemPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.SellItemPeekView] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.SortAndFilters] = { isTransparent = true, VRPanelPlacement = "Left" },
	[avatarScreenModule.TryOnItem] = {
		isTransparent = false,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.UpdateOutfitPage] = {
		isTransparent = true,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true
	},
	[avatarScreenModule.AdjustAccessoryView] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.HeadRefinement] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.LookDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.ITEM_DETAILS
		}
	},
	[avatarScreenModule.ContextMenu] = { VRPanelPlacement = "Right" },
	[avatarScreenModule.MySharedAvatars] = {
		isTryOnOutfitResetPage = true,
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.FavoritesSaved] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true
	},
	[avatarScreenModule.CommunityAvatarEntryMenu] = { VRPanelPlacement = "Left" },
	[avatarScreenModule.SearchLandingFocusedWidgetPage] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.SEARCH_LANDING_PAGE
		}
	},
	[avatarScreenModule.BodyShape] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.AvatarSwitcher] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	},
	[avatarScreenModule.EditEmotes] = {
		isTransparent = false,
		isTryOnOutfitResetPage = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
}

if fFlagAXOutfitPageRevamp then
	t_1[avatarScreenModule.AddOutfitDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.DuplicateOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Left" }
	t_1[avatarScreenModule.DuplicateOutfitNameDialog] = { isTransparent = false, VRPanelPlacement = "Left" }
	t_1[avatarScreenModule.RenameOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Right" }
	t_1[avatarScreenModule.DeleteOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Right" }
	t_1[avatarScreenModule.BulkDeleteOutfitDialog] = { isTransparent = false, VRPanelPlacement = "Left" }
	t_1[avatarScreenModule.ManageOutfitsPage] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
end
if fFlagAXAvatarFoldersEnabled then
	t_1[avatarScreenModule.CreateFolderDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.RenameFolderDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.DuplicateFolderNameDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.FolderNameNotAllowedDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.FolderLimitReachedDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.FolderErrorDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.DeleteFolderPrompt] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.SelectFolderMenu] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.RemoveFromFolderDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
	t_1[avatarScreenModule.FolderItemsErrorDialog] = {
		isTransparent = false,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
end
if fFlagAXFixAvatarScreenVR then
	if fFlagAXCatalogMakeupSupport then
		t_1[avatarScreenModule.MakeupMax6LayersPrompt] = {
			isTransparent = false,
			VRPanelPlacement = "Left",
			VRPanelRoundedCorners = true
		}
	end
	if fFlagAXMakeupReleaseFTUX then
		t_1[avatarScreenModule.MakeupReleaseFtuxPrompt] = {
			isTransparent = false,
			VRPanelPlacement = "Left",
			VRPanelRoundedCorners = true
		}
	end
end
if fFlagAXEditorSubcategoryFilters then
	t_1[avatarScreenModule.SubcategoryFiltersDropdown] = { isTransparent = true, VRPanelPlacement = "Left" }
end
if fFlagAXMISEnableMultiShopping then
	t_1[avatarScreenModule.Checkout] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CATALOG
		}
	}
end
if fFlagAXEnableProfileTab then
	t_1[avatarScreenModule.Profile] = {
		refinementButtonVisible = true,
		isTryOnOutfitResetPage = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true
	}
end
if fFlagAXEnableExpiredUserLookCheckout then
	t_1[avatarScreenModule.ExpiredUserLookActionBar] = {
		isTransparent = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true
	}
	t_1[avatarScreenModule.ExpiredUserLookCheckout] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = unifiedLoggingSurfaceModule.CUSTOMIZE
		}
	}
end
if fFlagEditProfileImageV2Enabled2 then
	t_1[avatarScreenModule.EditProfileImage] = { isTryOnOutfitResetPage = true }
	t_1[avatarScreenModule.AppCatalogContextMenuHost] = { isTransparent = true }
end
local t_2 = {}

for i, v in avatarScreenModule do
	t_2[v] = cryoModule.Dictionary.join(t, t_1[v] or {})
end
return t_2