import { redirect } from "next/navigation";

export default function Page() {
  async function action() {
    "use server";
    redirect("/redirect");
  }
  return (
    <main>
      <h1>
        <form action={action}>
          <button>Redirect</button>
        </form>
      </h1>
    </main>
  );
}
