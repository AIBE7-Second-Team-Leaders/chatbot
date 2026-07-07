import {createClient} from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm";

const SUPABASE_URL = "https://sbxlfgdwogpdondzyvia.supabase.co";
const SUPABASE_KEY = "sb_publishable_XHbMwByaC6Niq019201IXA_CBg83ih0";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

const logoutForm = document.querySelector("#logoutForm");

logoutForm.addEventListener("submit", async (event) => {
    event.preventDefault();

    await supabase.auth.signOut();

    logoutForm.submit();
});