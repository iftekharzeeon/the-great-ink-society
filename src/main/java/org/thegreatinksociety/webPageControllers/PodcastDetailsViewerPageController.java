package org.thegreatinksociety.webPageControllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PodcastDetailsViewerPageController {

    @RequestMapping("/podcastDetailsViewer")
    public String getPodcastDetailsViewerPage(){
        return "podcastDetailsViewer";
    }
}
